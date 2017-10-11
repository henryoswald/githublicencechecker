defmodule GithublicencerWeb.Repo.Migrations.AddRepositoryIdConstraintToRepository do
  use Ecto.Migration

  def change do
    create unique_index(:github_repos, [:user_id, :repository_id, :repository_type], name: :user_repositories_index)
  end
end
