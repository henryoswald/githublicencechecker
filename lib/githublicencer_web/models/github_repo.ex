defmodule GithublicencerWeb.GithubRepo do

  use GithublicencerWeb, :model

  schema "github_repos" do

    field :github_id, :integer

    field :name, :string
		field :owner, :string

    timestamps()

		belongs_to :user, GithublicencerWeb.User
		has_many :commits, GithublicencerWeb.Commit
		has_many :commiter, GithublicencerWeb.Commiter

  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:github_id, :user_id, :name, :owner])
    |> validate_required([:github_id, :user_id])
		|> unique_constraint(:github_id)
  end
end
