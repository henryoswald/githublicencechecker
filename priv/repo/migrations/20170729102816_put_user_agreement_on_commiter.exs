defmodule Githublicencer.Repo.Migrations.PutUserAgreementOnCommiter do
  use Ecto.Migration

  def change do
		drop table(:user_agreements)
  end
end
