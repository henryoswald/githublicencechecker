defmodule GithublicencerWeb.UserTest do
  use GithublicencerWeb.ModelCase

  alias GithublicencerWeb.User

  @valid_attrs %{avatar_url: "some content", github_id: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
