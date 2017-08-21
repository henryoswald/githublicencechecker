defmodule Githublicencer.Repo.Migrations.CreateUserAgreements do
  use Ecto.Migration

  def change do
    create table(:user_agreements) do
      add :user_id, :integer
      add :vaild, :boolean, default: false, null: false

      timestamps()
    end

  end
end
