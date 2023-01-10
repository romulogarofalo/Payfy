defmodule Payfy.Repo.Migrations.CreateRaffleTable do
  use Ecto.Migration

  def change do
    create table("raffles") do
      add :name, :string
      add :limit_date, :date
      add :id_join_raffle, :binary
      add :winner, :string
    end
  end
end
