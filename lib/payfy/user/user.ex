defmodule Payfy.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string

    many_to_many :raffle, Payfy.Raffle, join_through: "user_raffle"
  end

  @required_attrs [:name, :email]
  @castable_fields [:name, :email]

  def create_changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @castable_fields)
    |> validate_required(@required_attrs)
    |> validate_format(:email, ~r/^[a-zA-Z0-9]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/)
    |> unique_constraint([:email])
  end

  # def changeset_update_raffle(%__MODULE__{} = user, raffle) do
  #   user
  #   |> cast(%{}, [:user_id, :raffle_id])
  #   |> put_assoc(:raffles, raffle)
  # end
end
