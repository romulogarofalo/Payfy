defmodule PayfyWeb.RaffleController do
  use PayfyWeb, :controller

  alias Payfy.Raffle.Get
  alias Payfy.Raffle.Create
  alias Payfy.Raffle.Join
  # alias PayfyWeb.Helpers.ErrorHandler

  def get(conn, params) do
    # validar se a data ja passou, se nao passou dar erro
    case Get.run(params) do
      {:ok, raffle} ->
        conn
        |> put_status(:ok)
        |> render("raffle.json", %{raffle: raffle})

      {:error, :not_found} ->
        send_resp(conn, 404, "{\"message\":\"not found\"}")
    end
  end

  def create(conn, params) do
    params
    |> Create.run()
    |> case do
      {:ok, raffle_id} ->
        send_resp(conn, 200, "{\"raffle_id\": \"#{raffle_id}\"}")

      {:error, _} ->
        send_resp(conn, 400, "{\"message\":\"input error\"}")
    end
  end

  def join(conn, params) do
    # check if raffle pass the date
    # check if user exists\
    Join.run(params)
    send_resp(conn, 200, "{\"message\": \"you join the raffle\"}")
  end
end
