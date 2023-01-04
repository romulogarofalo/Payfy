defmodule PayfyWeb.RaffleController do
  use PayfyWeb, :controller

  alias Payfy.Jobs.CreateUser
  alias Payfy.Jobs.JoinRaffle
  alias Payfy.Raffle.Get
  alias Payfy.Raffle.Create
  alias PayfyWeb.Helpers.ErrorHandler

  def create(conn, params) do
    params
    |> Create.run()
    |> case do
      {:ok, ruffle_id} -> send_resp(conn, 200, "{\"ruffle_id\": \"#{ruffle_id}\"}")
      {:error, changeset_error} -> send_resp(conn, 400, "{\"message\":\"input error\"}")
    end
  end

  def join(conn, params) do
    # check if raffle pass the date
    # check if user exists
    JoinRaffle.new(params)
    |> Oban.insert!()


  end

  def get(conn, params) do
    # validar se a data ja passou, se nao passou dar erro
    case Get.run(params) do
      {:ok, raffle} ->
        conn
        |> put_status(:ok)
        |> render("raffle.json", %{raffle: raffle})

      {:error, %Ecto.Changeset{}} ->
        ErrorHandler.bad_request(conn)
    end
  end
end
