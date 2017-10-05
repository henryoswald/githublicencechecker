defmodule GithublicencerWeb.GithubLinkController do
  alias GithublicencerWeb.GithubRepo
  use GithublicencerWeb, :controller
  plug GithublicencerWeb.Plugs.RequireUser

  require IEx

  defp current_user(conn) do
    get_session(conn, :current_user)
  end

  defp client(conn) do
    Tentacat.Client.new(%{access_token: current_user(conn).access_token})
  end

  def index(conn, _params) do

    all_repositories = Tentacat.Repositories.list_mine(client(conn))

    linked_repo_names = (current_user(conn)
              |> Repo.preload(:repositories))
              .repositories

    filter = fn i -> !Enum.any?(linked_repo_names) or Enum.any?(linked_repo_names, & "#{Map.get(&1, :owner)}/#{Map.get(&1, :name)}" != i["full_name"]) end

    IEx.pry

    repositories = Enum.map(all_repositories, &Map.take(&1, ["full_name" , "fork"]))
                |> Enum.filter(filter)

    changeset = %{
      repositories: repositories,
      licences: ["CLA 1", "CLA 2"]
    }
    render conn, "index.html" , changeset: changeset
  end


  def create(conn, %{"github_link" => link}) do
    split = String.split(link["repository"], "/")
    owner = Enum.at(split, 0)
    name = Enum.at(split, 1)
    repository = Tentacat.Repositories.repo_get(owner, name, client(conn))
    hook = Tentacat.Hooks.list(owner, name, client(conn))
            |> Enum.find(& String.contains?(&1["config"]["url"], "hooks/github/#{owner}/#{name}"))

    if !hook do
      hook_body = %{
        "name" => "web",
        "active" => false,
        "events" => [ "push", "pull_request" ],
        "config" => %{
          "url" => "http://cla-sense.com/hooks/github/#{owner}/#{name}",
          "content_type" => "json"
        }
      }
      {_, hook} = Tentacat.Hooks.create(owner, name, hook_body, client(conn))
    end
    changeset = %GithubRepo{
      user_id: current_user(conn).id,
			name: name,
      owner: owner,
      repository_id: repository["id"],
      repository_type: "github",
			hook_id: hook["id"]
    }
    Repo.insert_or_update(GithubRepo.changeset(changeset))

    redirect(conn, to: github_link_path(conn, :index))
  end

end