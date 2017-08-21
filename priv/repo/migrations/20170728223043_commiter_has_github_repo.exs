defmodule Githublicencer.Repo.Migrations.CommiterHasGithubRepo do
  use Ecto.Migration

  def change do
		alter table(:commiters) do
			add :github_repo_id, :integer
		end
  end
end
