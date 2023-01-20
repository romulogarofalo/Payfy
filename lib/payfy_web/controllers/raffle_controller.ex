defmodule PayfyWeb.RaffleController do
  use PayfyWeb, :controller

  alias Payfy.Raffle.Get
  alias Payfy.Raffle.Create
  alias Payfy.Raffle.Join
  # alias PayfyWeb.Helpers.ErrorHandler

  def get(conn, params) do
    Get.run_after_limit_date(params)
    |> case do
      {:ok, raffle} ->
        conn
        |> put_status(:ok)
        |> render("raffle.json", %{raffle: raffle})

      {:error, :not_found} ->
        send_resp(conn, 404, "{\"message\":\"not found\"}")
      {:error, :invalid_date} ->
        send_resp(conn, 400, "{\"message\":\"can't show before the limit date\"}")
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
    Join.run(params)
    send_resp(conn, 200, "{\"message\": \"you join the raffle\"}")
  end
end
