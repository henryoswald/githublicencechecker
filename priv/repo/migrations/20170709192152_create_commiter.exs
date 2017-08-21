defmodule Githublicencer.Repo.Migrations.CreateCommiter do
  use Ecto.Migration

  def change do
    create table(:commiters) do
      add :email, :string
      add :name, :string
      add :github_user_id, :integer

      timestamps()
    end

  end
end
