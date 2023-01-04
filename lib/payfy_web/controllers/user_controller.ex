defmodule PayfyWeb.UserController do
  use PayfyWeb, :controller

  alias Payfy.User.Create
  alias PayfyWeb.Helpers.ErrorHandler

  def create(conn, params) do
    case Create.run(params) do
      {:ok, raffle} ->
        conn
        |> put_status(:created)
        |> render("created.json", %{raffle: raffle})

      # {:error,
      #  %Ecto.Changeset{
      #    errors: [
      #      email:
      #        {"has already been taken", [constraint: :unique, constraint_name: "users_email_index"]}
      #    ]
      #  }} ->
      #   ErrorHandler.conflict(conn)

      {:error, %Ecto.Changeset{}} ->
        ErrorHandler.bad_request(conn)

      {:error, _} ->
        ErrorHandler.internal_server_error(conn)
    end
  end
end
