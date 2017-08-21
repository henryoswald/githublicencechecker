defmodule Githublicencer.Repo.Migrations.AddRepoId do
  use Ecto.Migration

  def change do
		alter table(:user_agreements) do
			add :github_repo_id, :integer
		end
  end
end
