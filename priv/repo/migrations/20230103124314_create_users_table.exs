defmodule Payfy.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table("users") do
      add :name, :string
      add :email, :string
    end

    create unique_index(:users, [:email])
  end
end
