defmodule Githublicencer.Repo.Migrations.CreateCommit do
  use Ecto.Migration

  def change do
    create table(:commits) do
      add :sha, :string
      add :pullrequest, :integer
      add :commiter_id, :integer
      add :github_repo_id, :integer

      timestamps()
    end

  end
end
