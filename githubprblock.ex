

defmodule Githubpr do
	defp client do
		Tentacat.Client.new(%{access_token: "306c871c7024b0583cf6e3ac63e48089c0d1840d"})
	end

	def updatePr(owner, repo, hash, state) do
		body = %{
			"state": state,
			"target_url": "https://example.com/build/status",
			"description": "This user has not signed the cla - do so here",
			"context": "licence-checker"
		}
		o = Tentacat.Repositories.Statuses.create(owner, repo, hash, body, client())
		IO.inspect(o)
	end


end



defmodule PullRequest do
	defstruct [:id, :number]
end

#Githubpr.updatePr("henryoswald", "docBank", "14dd2087aef778c9fe95f3b62e1d16a7057649bb", "failure")



client = Tentacat.Client.new(%{access_token: "306c871c7024b0583cf6e3ac63e48089c0d1840d"})

prs = Tentacat.Pulls.filter("henryoswald", "docBank", %{state: "open"}, client)
# prCommits = Tentacat.Pulls.Commits.list("henryoswald", "docBank", "1", client)
Enum.map(prs, fn(pr)-> struct(PullRequest, %{id: pr["id"], number: pr["number"]}) end) |> IO.inspect
