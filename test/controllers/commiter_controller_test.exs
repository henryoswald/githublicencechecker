defmodule Githublicencer.CommiterControllerTest do
  use GithublicencerWeb.ConnCase

  alias Githublicencer.Commiter
  @valid_attrs %{email: "some content", manual_overide: true, name: "some content", note: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, commiter_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing commiters"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, commiter_path(conn, :new)
    assert html_response(conn, 200) =~ "New commiter"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, commiter_path(conn, :create), commiter: @valid_attrs
    assert redirected_to(conn) == commiter_path(conn, :index)
    assert Repo.get_by(Commiter, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, commiter_path(conn, :create), commiter: @invalid_attrs
    assert html_response(conn, 200) =~ "New commiter"
  end

  test "shows chosen resource", %{conn: conn} do
    commiter = Repo.insert! %Commiter{}
    conn = get conn, commiter_path(conn, :show, commiter)
    assert html_response(conn, 200) =~ "Show commiter"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, commiter_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    commiter = Repo.insert! %Commiter{}
    conn = get conn, commiter_path(conn, :edit, commiter)
    assert html_response(conn, 200) =~ "Edit commiter"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    commiter = Repo.insert! %Commiter{}
    conn = put conn, commiter_path(conn, :update, commiter), commiter: @valid_attrs
    assert redirected_to(conn) == commiter_path(conn, :show, commiter)
    assert Repo.get_by(Commiter, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    commiter = Repo.insert! %Commiter{}
    conn = put conn, commiter_path(conn, :update, commiter), commiter: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit commiter"
  end

  test "deletes chosen resource", %{conn: conn} do
    commiter = Repo.insert! %Commiter{}
    conn = delete conn, commiter_path(conn, :delete, commiter)
    assert redirected_to(conn) == commiter_path(conn, :index)
    refute Repo.get(Commiter, commiter.id)
  end
end
