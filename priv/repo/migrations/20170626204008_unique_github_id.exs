defmodule Githublicencer.Repo.Migrations.UniqueGithubId do
  use Ecto.Migration

  def change do
		create unique_index(:github_repos, [:github_id])
  end
end
