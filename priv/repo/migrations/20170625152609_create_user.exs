defmodule Githublicencer.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :github_id, :string
      add :name, :string
      add :avatar_url, :string

      timestamps()
    end

  end
end
