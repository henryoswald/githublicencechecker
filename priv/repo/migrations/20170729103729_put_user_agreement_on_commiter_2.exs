defmodule Githublicencer.Repo.Migrations.PutUserAgreementOnCommiter2 do
  use Ecto.Migration

  def change do
		alter table(:commiters) do
			add :manual_overide, :boolean
			add :sign_at, :naive_datetime
			add :signed_ip_address, :string
		end

  end
end
