defmodule Githublicencer.Repo.Migrations.UniqueCommitsOnly do
  use Ecto.Migration

  def change do
		create unique_index(:commits, [:sha])
  end
end
