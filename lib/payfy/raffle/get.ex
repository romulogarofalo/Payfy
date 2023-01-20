defmodule Payfy.Raffle.Get do
  alias Payfy.Repo
  alias Payfy.Raffle

  def run(%{"raffle_id" => id}) do
    Repo.get(Raffle, id)
    |> return_raffle()
  end

  def return_raffle(raffle) when is_nil(raffle), do: {:error, :not_found}
  def return_raffle(raffle), do:  {:ok, raffle}

  def run_after_limit_date(%{"raffle_id" => id}) do
    run(%{"raffle_id" => id})
    |> case do
      {:ok, raffle} ->
        if Date.diff(raffle.limit_date, Date.utc_today()) < 0 do
          {:ok, raffle}
        else
          {:error, :invalid_date}
        end
      {:error, :not_found} -> {:error, :not_found}
    end
  end
end
