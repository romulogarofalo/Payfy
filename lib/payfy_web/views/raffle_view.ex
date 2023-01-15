defmodule PayfyWeb.UserView do
  use PayfyWeb, :view

  def render("raffle.json", raffle) do
   %{
      raffle: raffle
    }
  end
end
