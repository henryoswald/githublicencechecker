defmodule GithublicencerWeb.User do
  use GithublicencerWeb, :model

  schema "user" do
    field :github_id, :string
    field :name, :string
    field :avatar_url, :string
    field :access_token, :string
    has_many :repositories, GithublicencerWeb.GithubRepo

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:github_id, :name, :avatar_url, :access_token])
    |> validate_required([:github_id, :name, :avatar_url, :access_token])
  end
end
