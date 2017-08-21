defmodule Githublicencer.PullrequestTest do
  use Githublicencer.ModelCase

  alias Githublicencer.Pullrequest

  @valid_attrs %{id: 42, number: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pullrequest.changeset(%Pullrequest{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pullrequest.changeset(%Pullrequest{}, @invalid_attrs)
    refute changeset.valid?
  end
end
