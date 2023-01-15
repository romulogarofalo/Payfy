defmodule PayfyWeb.RaffleControllerTest do
  use PayfyWeb.ConnCase

  use Oban.Testing, repo: Payfy.Repo

  describe "create raffle /api/raffle" do
    test "create raffle with rigth params, should return 200 ok", %{conn: conn} do
      conn =
        post(conn, Routes.raffle_path(conn, :create), %{
          "name" => "romulo",
          "limit_date" => "2023-04-01"
        })

        assert conn.status == 200
        [%{id: id_join_raffle}] = Payfy.Repo.all(Payfy.Raffle)

        assert conn.resp_body == "{\"raffle_id\": \"#{id_join_raffle}\"}"
    end
  end

  describe "join raffle" do
    test "user join raffle with right params, should return ok 201", %{conn: conn} do

      conn = post(conn, Routes.user_path(conn, :create), %{
        "name" => "romulo",
        "email" => "romulo@123.com"
      })

      %{"id" => user_id}= conn.resp_body |> Jason.decode!()
# usar a string de id de retorno para dar join
# fazer checks da criacao do user
      conn =
        post(conn, Routes.raffle_path(conn, :create), %{
          "name" => "carro",
          "limit_date" => "2023-04-01"
        })

        assert conn.status == 200
        [%{id: id_join_raffle}] = Payfy.Repo.all(Payfy.Raffle)

        assert conn.resp_body == "{\"raffle_id\": \"#{id_join_raffle}\"}"

        %{"raffle_id" => raffle_id} = conn.resp_body |> Jason.decode!()

        post(conn, Routes.raffle_path(conn, :join), %{
          "user_id" => user_id,
          "raffle_id" => raffle_id
        })

        # fazer ultimas checagens
    end
  end

  describe "get raffle" do
    test "should return a ruffle with ok 200", %{conn: conn} do
      raffle_id = Ecto.UUID.generate()

      conn = get(conn, Routes.raffle_path(conn, :get), %{
        "raffle_id" => raffle_id
      })

      assert conn.resp_body == ""
    end
  end

end
