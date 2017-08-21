defmodule GithublicencerWeb.CommitController do
  use GithublicencerWeb, :controller

  alias GithublicencerWeb.Commit

  def index(conn, _params) do
    commits = Repo.all(Commit)
    render(conn, "index.json", commits: commits)
  end

  def create(conn, %{"commit" => commit_params}) do
    changeset = Commit.changeset(%Commit{}, commit_params)

    case Repo.insert(changeset) do
      {:ok, commit} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", commit_path(conn, :show, commit))
        |> render("show.json", commit: commit)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(GithublicencerWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    commit = Repo.get!(Commit, id)
    render(conn, "show.json", commit: commit)
  end

  def update(conn, %{"id" => id, "commit" => commit_params}) do
    commit = Repo.get!(Commit, id)
    changeset = Commit.changeset(commit, commit_params)

    case Repo.update(changeset) do
      {:ok, commit} ->
        render(conn, "show.json", commit: commit)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(GithublicencerWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    commit = Repo.get!(Commit, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(commit)

    send_resp(conn, :no_content, "")
  end
end
