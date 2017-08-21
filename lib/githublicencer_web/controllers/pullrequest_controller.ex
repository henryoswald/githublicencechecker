defmodule GithublicencerWeb.PullrequestController do
  use GithublicencerWeb, :controller

  alias GithublicencerWeb.Pullrequest

  def index(conn, _params) do
    pullrequests = Repo.all(Pullrequest)
    render(conn, "index.html", pullrequests: pullrequests)
  end

  def new(conn, _params) do
    changeset = Pullrequest.changeset(%Pullrequest{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pullrequest" => pullrequest_params}) do
    changeset = Pullrequest.changeset(%Pullrequest{}, pullrequest_params)

    case Repo.insert(changeset) do
      {:ok, _pullrequest} ->
        conn
        |> put_flash(:info, "Pullrequest created successfully.")
        |> redirect(to: pullrequest_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pullrequest = Repo.get!(Pullrequest, id)
    render(conn, "show.html", pullrequest: pullrequest)
  end

  def edit(conn, %{"id" => id}) do
    pullrequest = Repo.get!(Pullrequest, id)
    changeset = Pullrequest.changeset(pullrequest)
    render(conn, "edit.html", pullrequest: pullrequest, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pullrequest" => pullrequest_params}) do
    pullrequest = Repo.get!(Pullrequest, id)
    changeset = Pullrequest.changeset(pullrequest, pullrequest_params)

    case Repo.update(changeset) do
      {:ok, pullrequest} ->
        conn
        |> put_flash(:info, "Pullrequest updated successfully.")
        |> redirect(to: pullrequest_path(conn, :show, pullrequest))
      {:error, changeset} ->
        render(conn, "edit.html", pullrequest: pullrequest, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pullrequest = Repo.get!(Pullrequest, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(pullrequest)

    conn
    |> put_flash(:info, "Pullrequest deleted successfully.")
    |> redirect(to: pullrequest_path(conn, :index))
  end
end
