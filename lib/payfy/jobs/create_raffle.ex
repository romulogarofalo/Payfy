defmodule Payfy.Jobs.CreateRaffle do

  use Oban.Worker, queue: "default", max_attempts: 3

  @impl Oban.Worker
  def perform(%Oban.Job{
    args: %{
      "name" => name,
      "limit_date" => limit_date
    }
  }) do
    Payfy.Raffle.Create.run(%{name: name, limit_date: limit_date})
  end
end
