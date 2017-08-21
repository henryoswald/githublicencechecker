defmodule Githublicencer.CommiterTest do
  use Githublicencer.ModelCase

  alias Githublicencer.Commiter

  @valid_attrs %{email: "some content", github_user_id: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Commiter.changeset(%Commiter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Commiter.changeset(%Commiter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
