defmodule Payfy.Raffle.Create do
  alias Payfy.Raffle

  @spec run(map()) :: {:ok, Ecto.Changeset} | {:error, Ecto.Changeset}
  def run(params) do
    params
    |> Raffle.create_changeset()
    |> create_job_raffle()
  end

  def create_job_raffle(%Ecto.Changeset{errors: [_|_]} = changeset), do: {:error, changeset}
  def create_job_raffle(changeset) do
    Payfy.Jobs.CreateRaffle.new(%{"changeset_raffle" => changeset})
    |> Oban.insert!()

    {:ok, Ecto.UUID.generate()}
  end
end
