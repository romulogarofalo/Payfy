defmodule Payfy.Jobs.JoinRaffle do

  use Oban.Worker, queue: "default", max_attempts: 3

  @impl Oban.Worker
  def perform(%Oban.Job{
    args: %{
      "changeset_raffle" => changeset_raffle,
    }
  }) do
    Payfy.Repo.insert!(changeset_raffle)
  end
end
