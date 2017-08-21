defmodule Githublicencer.Repo.Migrations.UniqueCommits do
  use Ecto.Migration

  def change do
		create unique_index(:commits, [:sha, :github_repo_id])
  end
end
