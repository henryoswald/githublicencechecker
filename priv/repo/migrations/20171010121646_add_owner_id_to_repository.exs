defmodule GithublicencerWeb.Repo.Migrations.AddOwnerIdToRepository do
  use Ecto.Migration

  def change do
    alter table(:github_repos) do
			add :owner_id, :integer
    end
  end
end
