defmodule EventWeb.Api.TokenView do
  use EventWeb.Web, :view

  def render("login.json", %{name: name}) do
    %{
      data: name
    }
  end

  def render("logout.json", _) do
    %{
      success: true
    }
  end

  # def render(_, _) do
  #   %{
  #     data: "Hello, World"
  #   }
  # end
end
