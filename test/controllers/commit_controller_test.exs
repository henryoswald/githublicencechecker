defmodule GithublicencerWeb.CommitControllerTest do
  use GithublicencerWeb.ConnCase

  alias GithublicencerWeb.Commit
  @valid_attrs %{commiter: 42, github_repo: 42, pullrequest: 42, sha: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, commit_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    commit = Repo.insert! %Commit{}
    conn = get conn, commit_path(conn, :show, commit)
    assert json_response(conn, 200)["data"] == %{"id" => commit.id,
      "sha" => commit.sha,
      "pullrequest" => commit.pullrequest,
      "commiter" => commit.commiter,
      "github_repo" => commit.github_repo}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, commit_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, commit_path(conn, :create), commit: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Commit, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, commit_path(conn, :create), commit: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    commit = Repo.insert! %Commit{}
    conn = put conn, commit_path(conn, :update, commit), commit: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Commit, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    commit = Repo.insert! %Commit{}
    conn = put conn, commit_path(conn, :update, commit), commit: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    commit = Repo.insert! %Commit{}
    conn = delete conn, commit_path(conn, :delete, commit)
    assert response(conn, 204)
    refute Repo.get(Commit, commit.id)
  end
end
