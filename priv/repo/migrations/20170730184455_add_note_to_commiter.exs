defmodule Githublicencer.Repo.Migrations.AddNoteToCommiter do
  use Ecto.Migration

  def change do
		
		alter table(:commiters) do
			add :note, :string
		end

  end
end
