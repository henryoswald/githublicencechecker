defmodule Githublicencer.Repo.Migrations.CreateGithubRepo do
  use Ecto.Migration

  def change do
    create table(:github_repos) do
      add :github_id, :integer
      add :user_id, :integer

      timestamps()
    end

  end
end
