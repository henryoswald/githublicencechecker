defmodule Githublicencer.CommitTest do
  use Githublicencer.ModelCase

  alias Githublicencer.Commit

  @valid_attrs %{commiter: 42, github_repo: 42, pullrequest: 42, sha: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Commit.changeset(%Commit{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Commit.changeset(%Commit{}, @invalid_attrs)
    refute changeset.valid?
  end
end
