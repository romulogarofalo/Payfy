defmodule PayfyWeb.RaffleControllerTest do
  use PayfyWeb.ConnCase

  use Oban.Testing, repo: Payfy.Repo

  describe "/api/raffle" do
    test "create raffle", %{conn: conn} do
      conn =
        post(conn, Routes.raffle_path(conn, :create), %{
          "name" => "romulo",
          "limit_date" => "2023-04-01"
        })

        assert conn.status == 200
        [%{id_join_raffle: id_join_raffle}] = Payfy.Repo.all(Payfy.Raffle)

        assert conn.resp_body == "{\"ruffle_id\": \"#{id_join_raffle}\"}"
    end
  end
end
