defmodule Payfy.Raffle.Create do
  alias Payfy.Raffle

  @spec run(map()) :: {:ok, Ecto.Changeset} | {:error, Ecto.Changeset}
  def run(params) do
    params
    |> Raffle.create_changeset()
    |> create_job_raffle()
  end

  def create_job_raffle(%Ecto.Changeset{errors: [_ | _]} = changeset), do: {:error, changeset}

  def create_job_raffle(changeset) do
    id_join_raffle = Ecto.UUID.generate()

    changeset.changes
    |> Map.put(:id, id_join_raffle)
    |> Payfy.Jobs.CreateRaffle.new()
    |> Oban.insert!()

    {:ok, id_join_raffle}
  end
end
