defmodule GithublicencerWeb.Pullrequest do
  use GithublicencerWeb, :model

  schema "pullrequests" do
    field :number, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:number])
    |> validate_required([:number])
  end
end
