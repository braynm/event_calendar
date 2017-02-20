defmodule EventWeb.Router do
  use EventWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    # plug Guardian.Plug.EnsureAuthenticated, handler: ApiTok
  end

  scope "/", EventWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/auth", EventWeb do
    pipe_through :api
    post "/login", Api.AuthController, :login
  end

  # Other scopes may use custom stacks.
  scope "/api", EventWeb do
    pipe_through :api
    pipe_through :api_auth
  end
end
