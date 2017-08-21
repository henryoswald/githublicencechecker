
defmodule GithublicencerWebhookController do
	use GithublicencerWeb, :controller

	alias GithublicencerWeb.GithubRepo
	alias GithublicencerWeb.GithubHandler
	alias GithublicencerWeb.CommitHandler
	alias GithublicencerWeb.CommiterHandler

	alias GithublicencerWeb.Pullrequest

	alias CommitterChecker

	def webhook(conn, _params) do

		repoChangeSet = %{
			user_id: 1,
			name: conn.params["repository"]["name"],
			owner: conn.params["repository"]["owner"]["login"],
			github_id: conn.params["repository"]["id"]
		}

		case {:ok, github_repo} = Repo.get_or_insert(GithubRepo, repoChangeSet) do
			{:ok, github_repo} ->
				IO.puts("inserted github repo")
				CommitHandler.backfill_commits(github_repo)
				{:ok, github_repo}
			{:error, changeset} ->
				IO.puts("ERROR INSERTING GITHUB REPO")
				IO.inspect(changeset.errors)
				{:error, changeset}
		end


		commits = GithubHandler.get_pull_commits(github_repo, conn.params["number"])

		CommiterHandler.upsert_committers(commits, github_repo)

		Enum.each commits, fn(commit)->
			 CommitHandler.upsert_commit(commit, github_repo)
		end


		prChangeset = Pullrequest.changeset(%Pullrequest{}, conn.params)

		case Repo.insert(prChangeset) do
			{:ok, _pullrequest} ->
				conn |> put_status(:ok) |> json(nil)
			{:error, _changeset} ->
				conn |> put_status(:ok) |> json(nil)
		end
	end









end
