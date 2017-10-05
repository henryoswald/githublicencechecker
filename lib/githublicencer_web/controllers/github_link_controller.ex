defmodule GithublicencerWeb.GithubLinkController do
  use GithublicencerWeb, :controller
  plug GithublicencerWeb.Plugs.RequireUser

  import IEx
  def index(conn, _params) do
    user = get_session(conn, :current_user)

    client = Tentacat.Client.new(%{access_token: user.access_token})
    all_repositories = Tentacat.Repositories.list_mine(client)

    linked_repo_names = (user
              |> Repo.preload(:github_repos))
              .github_repos
              |> Enum.map(& &1.name)

    filter = fn i -> !Enum.any?([]) or Enum.any?(linked_repo_names, & &1["full_name"] != i) end

    repositories = Enum.map(all_repositories, &Map.take(&1, ["full_name" , "fork"]))
                |> Enum.filter(filter)

    changeset = %{
      repositories: repositories,
      licences: ["CLA 1", "CLA 2"]
    }
    render conn, "index.html" , changeset: changeset
  end


  def create(conn, _params) do
    conn
  end

end