defmodule GithublicencerWeb.Repo.Migrations.SignUserName do
  use Ecto.Migration

  def change do
		alter table(:commiters) do
			add :signed_name, :string
		end
	end
end
