defmodule GithublicencerWeb.Repo.Migrations.AddIsForkToRepository do
  use Ecto.Migration

  def change do
    alter table(:github_repos) do
			add :fork, :boolean
    end
  end
end
