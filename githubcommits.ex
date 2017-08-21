
defmodule GithubCommiter do
	defstruct [:id, :login, :avatar_url, :email]
end

defmodule GithubRepo do
	defstruct [:id, :name]
end

defmodule Githublicencer do

	def getAllCommitersInOrg(orgname) do
		repos = getRepos(orgname)
		first = List.first(repos)
		commiters = getCommitters(first)
		IO.inspect(commiters)
		commiters |> length |> IO.puts
	end

	defp client do
		Tentacat.Client.new(%{access_token: "306c871c7024b0583cf6e3ac63e48089c0d1840d"})
	end


	# IO.inspect(reposToSearch)

	defp getRepos(orgName) do
		Tentacat.Repositories.list_orgs(orgName,client())
		|> Enum.flat_map(fn(repo)-> [struct(GithubRepo, %{id: repo["id"], name: repo["name"]})] end)
	end


	# IO.puts(Tentacat.Commits.list("sharelatex", "9217269"))

	# Commiters = Tentacat.Commits.list("sharelatex", "sharelatex", client) |>  Enum.flat_map(fn(commit)-> [commit["committer"]["id"]] end) |> Enum.uniq


	defp getCommitters(repo) do
		Tentacat.Commits.list("sharelatex", repo.name, client())
		|> Enum.flat_map(fn(commit)-> [ commit["committer"]] end)
		|> Enum.flat_map(fn(commiter)-> [ struct(GithubCommiter, %{id: commiter["id"], login: commiter["login"]})] end)
		|> Enum.uniq
	end

	# reposToSearch |> getCommitters |> IO.inspect

end


org = "sharelatex"

Githublicencer.getAllCommitersInOrg(org)
# # repos |> List.first |> Map.keys |> IO.inspect
#
# reposToSearch = repos
# first = reposToSearch |> List.first

# Githublicencer.getCommitters(first, client) |> IO.inspect
