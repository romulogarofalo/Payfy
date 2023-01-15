defmodule Payfy.Jobs.CreateRaffle do
  use Oban.Worker, queue: "default", max_attempts: 3

  @impl Oban.Worker
  def perform(%Oban.Job{
        args: %{
          "name" => name,
          "limit_date" => limit_date,
          "id" => id
        }
        }) do
    Payfy.Raffle.create_changeset(%{name: name, limit_date: limit_date, id: id})
    |> Payfy.Repo.insert() # passar esse insert para arquivo responsavel pela insercao?
  end
end
