defmodule Githublicencer.GithubRepoTest do
  use Githublicencer.ModelCase

  alias Githublicencer.GithubRepo

  @valid_attrs %{github_id: 42, id: 42, user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = GithubRepo.changeset(%GithubRepo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = GithubRepo.changeset(%GithubRepo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
