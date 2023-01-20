defmodule PayfyWeb.UserController do
  use PayfyWeb, :controller

  alias Payfy.User.Create

  def create(conn, params) do
    case Create.run(params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("created.json", %{user: user})

      {:error, %Ecto.Changeset{}} ->
        send_resp(conn, 404, "{\"message\":\"not found\"}")

      {:error, _} ->
        send_resp(conn, 404, "{\"message\":\"not found\"}")
    end
  end
end
