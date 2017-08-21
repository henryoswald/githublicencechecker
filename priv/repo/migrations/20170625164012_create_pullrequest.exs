defmodule Githublicencer.Repo.Migrations.CreatePullrequest do
  use Ecto.Migration

  def change do
    create table(:pullrequests) do
      add :number, :integer

      timestamps()
    end

  end
end
