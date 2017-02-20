defmodule EventWeb.Api.AuthView do
  use EventWeb.Web, :view

  def render("login.json", %{body: %{id: id, name: name, email: email} = params}), do: %{ data: params }
  def render("login.json", _params), do: %{data: "Invalid request"}

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
