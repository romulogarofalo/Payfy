defmodule PayfyWeb.UserControllerTest do
  use PayfyWeb.ConnCase

  use Oban.Testing, repo: Payfy.Repo

  describe "create user /api/user" do
    test "create user with rigth params, should return 200 ok", %{conn: conn} do
      conn =
        post(conn, Routes.user_path(conn, :create), %{
          "name" => "romulo",
          "email" => "romulo@123.com"
        })

        assert conn.status == 201
        [%{id: id_user}] = Payfy.Repo.all(Payfy.User)

        assert conn.resp_body == "{\"id\":#{id_user}}"
    end

    test "create user with rigth params, should return 200 ok", %{conn: conn} do
      conn =
        post(conn, Routes.user_path(conn, :create), %{
          "name" => "romulo",
          "email" => "romulo@123.com"
        })

        assert conn.status == 201
        [%{id: id_user}] = Payfy.Repo.all(Payfy.User)

        assert conn.resp_body == "{\"id\":#{id_user}}"
    end
  end
end
