defmodule Payfy.Raffle.Get do
  alias Payfy.Repo
  alias Payfy.Raffle

  def run(id) do
    raffle = Repo.get!(Raffle, id)

    if not is_nil(raffle) do
      {:ok, raffle}
    else
      {:error, :not_found}
    end
  end

end
