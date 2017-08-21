defmodule Githublicencer.Repo.Migrations.AddRepoName do
  use Ecto.Migration

  def change do
		alter table(:github_repos) do
      add :name, :string
			add :owner, :string

    end
  end
end
