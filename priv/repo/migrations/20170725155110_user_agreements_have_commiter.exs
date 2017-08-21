defmodule Githublicencer.Repo.Migrations.UserAgreementsHaveCommiter do
  use Ecto.Migration

  def change do
		alter table(:commiters) do
      add :user_agreement_id, :integer
    end
		alter table(:user_agreements) do
			add :commiter_id, :integer
		end
  end
end
