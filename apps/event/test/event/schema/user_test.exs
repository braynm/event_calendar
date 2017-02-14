defmodule Event.Schema.UserTest do
  use ExUnit.Case
  alias Event.Schema.User

  # Changeset test
  @params %{ name: "Bryan Madrid", password: "test123", email: "bryanfmarid@gmail.com" }

  test "user params with valid inputs" do
    user = User.build(@params)
    assert user.valid? == true
  end

  test "user params with no email" do
    user = User.build(%{ @params | email: "" })
    assert user.valid? == false
    assert Keyword.get(user.errors, :email) == {"can't be blank", [validation: :required]}
  end
  
  test "correct password encryption" do
    user = User.build(@params)
    assert Comeonin.Bcrypt.checkpw(@params.password, user.changes.password_encrypted) == true
  end
end
