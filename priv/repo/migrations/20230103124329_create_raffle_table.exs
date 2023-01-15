defmodule Payfy.Repo.Migrations.CreateRaffleTable do
  use Ecto.Migration

  def change do
    create table("raffles", primary_key: false) do
      add :id, :uuid, primary_key: true, null: false, default: fragment("gen_random_uuid()")
      add :name, :string
      add :limit_date, :date
      add :winner, :string
    end
  end
end
