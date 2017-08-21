defmodule GithublicencerWeb.GithubHandler do

	defp client do
 	 Tentacat.Client.new(%{access_token: ""})
  end

	def get_pull_commits(github_repo, pr_number) do
		Tentacat.Pulls.Commits.list(github_repo.owner, github_repo.name, pr_number, client())
	end

	def get_all_commits(github_repo) do
		Tentacat.Commits.list(github_repo.owner, github_repo.name, client())
	end

end
