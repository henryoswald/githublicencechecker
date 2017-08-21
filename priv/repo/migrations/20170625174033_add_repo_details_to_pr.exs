defmodule Githublicencer.Repo.Migrations.AddRepoDetailsToPr do
  use Ecto.Migration

	def change do
		alter table(:pullrequests) do

			add :repo_id, :integer
		end

	end
end
