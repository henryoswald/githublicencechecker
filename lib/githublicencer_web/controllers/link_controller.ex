defmodule GithublicencerWeb.LinkController do
  use GithublicencerWeb, :controller
  plug GithublicencerWeb.Plugs.RequireUser

  defp client do
    Tentacat.Client.new(access_token: Application.get_env(:tentacat, :access_token))
  end


  def index(conn, _params) do
    all_repos = Tentacat.Repositories.list_users("antonydenyer", client())
    linked_repo_names = (get_session(conn, :current_user)
              |> Repo.preload(:github_repos))
              .github_repos
              |> Enum.map(& &1.name)

    filter = fn i -> Enum.any?(linked_repo_names, & &1 != i["full_name"]) end

    repos = Enum.map(all_repos, &Map.take(&1, ["full_name" , "fork"]))
            |> Enum.filter(filter)

    model = %{
      repositories: repos,
      licences: ["CLA 1", "CLA 2"]
    }
    json conn, model
  end

end