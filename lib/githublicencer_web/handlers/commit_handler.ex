defmodule GithublicencerWeb.CommitHandler do

	alias GithublicencerWeb.Commit
	alias GithublicencerWeb.Commiter
	alias GithublicencerWeb.GithubHandler
	alias GithublicencerWeb.CommiterHandler

	alias GithublicencerWeb.Repo

	def upsert_commit(commit, github_repo) do

		if is_nil(commit["committer"]["id"]) do
			IO.puts("commit is empty, this is terrible")
			IO.inspect(commit)

		else

			commiter = Repo.get_by!(Commiter, github_user_id: commit["committer"]["id"])

			changeset = Commit.changeset(%Commit{}, %{sha: commit["sha"], commiter_id: commiter.id, github_repo_id: github_repo.id})

			case Repo.insert(changeset) do
					{:ok, _} ->
						IO.puts("inserted")
					{:error, message}  ->
							if !is_dup_insert(message) do
								IO.inspect("unexpected error")
								IO.inspect(message)
							end
			end

		end

	end

	def backfill_commits(github_repo) do

		IO.puts("backfilling github repo")
		commits = GithubHandler.get_all_commits(github_repo)

		CommiterHandler.upsert_committers(commits, github_repo)

		Enum.each(commits,
			fn(commit)->
			 upsert_commit(commit, github_repo)
		 	end
		)

	end


	defp is_dup_insert(error_message) do
		e = List.first(error_message.errors)
		is_dup_insert = elem(elem(e,1),0) =~ "has already been taken"
		is_dup_insert
	end


end
