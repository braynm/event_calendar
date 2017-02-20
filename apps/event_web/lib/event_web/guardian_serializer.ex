defmodule EventWeb.GuardianSerializer do
  @behaviour Guardian.Serializer

  def for_token(user = %{}), do: {:ok, "User: #{user.id}"}
  def for_token(_), do: {:error, "Unknown resource type"}

  def from_token("User:" <> id), do: {:ok, %{ id: 1, username: "Test", password: "123" }}
  def from_token(_), do: {:error, "Unknown resource"}
end