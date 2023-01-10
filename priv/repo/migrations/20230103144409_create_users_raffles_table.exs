defmodule Payfy.Repo.Migrations.CreateUsersRafflesTable do
  use Ecto.Migration

  def change do
    create table("user_raffle", primary_key: false) do
      add(:user_id, references(:users, on_delete: :delete_all), primary_key: true)
      add(:raffle_id, references(:raffles, on_delete: :delete_all), primary_key: true)
    end

    create index(:user_raffle, [:user_id])
    create index(:user_raffle, [:raffle_id])
  end
end
