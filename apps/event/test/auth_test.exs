defmodule AuthTest do
  use ExUnit.Case
  alias Event.Schema.User

  @params %{ name: "Bryan Madrid", email: "bryanfmadrid@gmail.com", password: "qweasd" }

  setup_all do
    # delete all
    Auth.register(@params)
    :ok
  end

  test "auth registration" do
    assert {:ok, _} = Auth.register(%{@params | email: "jack@gmail.com"})
  end

  test "auth login" do
    assert {:ok, _} = Auth.login("bryanfmadrid@gmail.com", "qweasd")
  end

  test "auth login incorrect email" do
    assert {:error, :not_found} = Auth.login("test@gmail.com", "qweasd")
  end

  test "auth login incorrect password" do
    assert {:error, :unauthorized} =  Auth.login("bryanfmadrid@gmail.com", "password!123")
  end
end
