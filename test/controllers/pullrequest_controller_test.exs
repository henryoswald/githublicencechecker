defmodule Githublicencer.PullrequestControllerTest do
  use GithublicencerWeb.ConnCase

  alias Githublicencer.Pullrequest
  @valid_attrs %{id: 42, number: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pullrequest_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pullrequests"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, pullrequest_path(conn, :new)
    assert html_response(conn, 200) =~ "New pullrequest"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, pullrequest_path(conn, :create), pullrequest: @valid_attrs
    assert redirected_to(conn) == pullrequest_path(conn, :index)
    assert Repo.get_by(Pullrequest, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pullrequest_path(conn, :create), pullrequest: @invalid_attrs
    assert html_response(conn, 200) =~ "New pullrequest"
  end

  test "shows chosen resource", %{conn: conn} do
    pullrequest = Repo.insert! %Pullrequest{}
    conn = get conn, pullrequest_path(conn, :show, pullrequest)
    assert html_response(conn, 200) =~ "Show pullrequest"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pullrequest_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    pullrequest = Repo.insert! %Pullrequest{}
    conn = get conn, pullrequest_path(conn, :edit, pullrequest)
    assert html_response(conn, 200) =~ "Edit pullrequest"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    pullrequest = Repo.insert! %Pullrequest{}
    conn = put conn, pullrequest_path(conn, :update, pullrequest), pullrequest: @valid_attrs
    assert redirected_to(conn) == pullrequest_path(conn, :show, pullrequest)
    assert Repo.get_by(Pullrequest, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pullrequest = Repo.insert! %Pullrequest{}
    conn = put conn, pullrequest_path(conn, :update, pullrequest), pullrequest: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit pullrequest"
  end

  test "deletes chosen resource", %{conn: conn} do
    pullrequest = Repo.insert! %Pullrequest{}
    conn = delete conn, pullrequest_path(conn, :delete, pullrequest)
    assert redirected_to(conn) == pullrequest_path(conn, :index)
    refute Repo.get(Pullrequest, pullrequest.id)
  end
end
