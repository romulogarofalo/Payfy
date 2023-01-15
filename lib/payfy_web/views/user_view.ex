defmodule PayfyWeb.UserView do
  use PayfyWeb, :view

  def render("created.json", %{user: user}) do
   %{
      id: user.id
    }
  end
end
