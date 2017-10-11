defmodule GithublicencerWeb.Repo.Migrations.AddAccessTokenToUser do
  use Ecto.Migration

  def change do
    alter table(:user) do
			add :access_token, :string
		end
  end
end
