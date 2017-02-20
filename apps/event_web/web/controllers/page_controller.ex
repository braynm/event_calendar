defmodule EventWeb.PageController do
  use EventWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
