defmodule EventWeb.Api.TokenController do
  use EventWeb.Web, :controller

  def unauthenticated(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
  end

  def unauthorized(conn, _params) do
    conn
    |> put_status(401)
    |> render "unauthorized.json", message: "Authentication required"
  end
end