defmodule PayfyWeb.UserController do
  use PayfyWeb, :controller

  alias Payfy.User.Create
  alias PayfyWeb.Helpers.ErrorHandler

  def create(conn, params) do
    case Create.run(params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("created.json", %{user: user})

      {:error, %Ecto.Changeset{}} ->
        ErrorHandler.bad_request(conn)

      {:error, _} ->
        ErrorHandler.internal_server_error(conn)
    end
  end
end
