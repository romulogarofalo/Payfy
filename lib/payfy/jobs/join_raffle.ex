defmodule Payfy.Jobs.JoinRaffle do
  use Oban.Worker, queue: "default", max_attempts: 3

  @impl Oban.Worker
  def perform(%Oban.Job{
        args: %{
          "user_id" => user_id,
          "raffle_id" => raffle_id
        }
      }) do

    %{
      limit_date: limit_date
    } = raffle = Payfy.Repo.get(Payfy.Raffle, raffle_id) |> Payfy.Repo.preload([:users])

    user = Payfy.Repo.get(Payfy.User, user_id)

    if Date.diff(limit_date, Date.utc_today()) > 0 do
      Ecto.Changeset.change(raffle)
      |> Ecto.Changeset.put_assoc(:users, [user])
      |> Payfy.Repo.update!()
    end
  end
end
