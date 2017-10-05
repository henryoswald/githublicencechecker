defmodule GithublicencerWeb.Repo.Migrations.AddHookIdToRepository do
  use Ecto.Migration

  def change do
    alter table(:github_repos) do
			add :hook_id, :integer
      add :repository_type, :string
    end

    rename table(:github_repos), :github_id, to: :repository_id
  end
end
