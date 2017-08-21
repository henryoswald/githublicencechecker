defmodule Githublicencer.Repo.Migrations.AddParentCommiterIdToCommiter do
  use Ecto.Migration

  def change do
		alter table(:commiters) do
			add :parent_commiter_id, :integer
		end

  end
end
