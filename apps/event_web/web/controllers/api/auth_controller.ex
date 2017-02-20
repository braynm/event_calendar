defmodule EventWeb.Api.AuthController do
  use EventWeb.Web, :controller
  alias Event.Schema.User


  # Process request
  # TODO: JWT user permission, expiration
  def login(conn, %{"email" => email, "password" => password}) do
    user = case Auth.login(email, password) do
      {:ok, %User{id: id, name: name, email: email}} -> %{id: id, name: name, email: email}
      {:error, reason} -> nil
    end

    IO.puts "User: #{inspect user}"
    do_jwt(conn, user)
    |> render "login.json", %{body: user}
  end

  # Bad Request, invalid params
  def login(conn, _) do
    conn
    |> put_status(400)
    |> render "login.json"
  end

  # def test_login(conn, %{"name" => name} = params) do
  #   IO.puts "params: #{inspect params}"
  #   IO.puts "params: #{inspect conn}"
  #   render conn, "test_login.json", %{name: name, resp: params}
  # end

  def logout(conn, _params) do
    jwt = Guardian.Plug.current_token(conn)
    claims = Guardian.Plug.claims(conn)
    Guardian.revoke!(jwt, claims)
    render "logout.json"
  end

  def do_jwt(conn, %{id: id, email: email, name: name}) do
    new_conn = conn
    |> Guardian.Plug.api_sign_in(%{id: id, name: name, email: email})

    token = Guardian.Plug.current_token(new_conn)

    new_conn
    |> put_resp_header("authorization", "Bearer: #{token}")
  end

  def do_jwt(conn, nil) do
    conn
    |> put_status(401)
  end
end