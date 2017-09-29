defmodule GithublicencerWeb.GithubLinkController do
  use GithublicencerWeb, :controller
  plug GithublicencerWeb.Plugs.RequireUser


  defp client do
    Tentacat.Client.new(%{access_token: Application.get_env(:tentacat, :access_token)})
  end


  def index(conn, _params) do
    all_repos = Tentacat.Repositories.list_users("antonydenyer", client())
    linked_repo_names = (get_session(conn, :current_user)
              |> Repo.preload(:github_repos))
              .github_repos
              |> Enum.map(& &1.name)

    filter = fn i -> Enum.any?(linked_repo_names, & &1 != i) end

    repos = Enum.map(all_repos, & &1["full_name"])
            |> Enum.filter(filter)

    changeset = %{
      repositories: repos,
      licences: ["CLA 1", "CLA 2"]
    }
    render conn, "index.html" , changeset: changeset
  end


  def create(conn, _params) do
    conn
  end

end