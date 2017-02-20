defmodule EventWeb.Api.AuthControllerTest do
  use EventWeb.ConnCase

  test "POST /auth/login", %{conn: conn} do
    data = %{email: "bryanfmadrid@gmail.com", password: "qwe123"}
    conn = post conn, "/auth/login", data
    assert %{"data" => "Invalid request"} = json_response(conn, 401)
  end

  test "POST 400 status - missing password /auth/login", %{conn: conn} do
    data = %{email: "bryanfmadrid@gmail.com"}
    conn = post conn, "/auth/login", data
    assert %{"data" =>  "Invalid request"} = json_response(conn, 400)
  end

  test "POST 200 status - /auth/login", %{conn: conn} do
    data = %{email: "bryanfmadrid@gmail.com", password: "qweasd"}
    conn = post conn, "/auth/login", data
    assert %{"data" => %{"email" => "bryanfmadrid@gmail.com"}} = json_response(conn, 200)
  end
end
