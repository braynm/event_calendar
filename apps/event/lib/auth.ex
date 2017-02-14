defmodule Auth do
  alias Event.Schema.User
  alias Event.Repo

  def register(params) do
    User.build(params)
    |> Repo.insert
  end

  def login(email, password) do
    user = Repo.get_by(User, email: email)
    do_login(user, password)
  end

  defp do_login(%User{password_encrypted: password_encrypted} = user, password) do
    case Comeonin.Bcrypt.checkpw(password, password_encrypted) do
      true -> {:ok, user}
      _ -> {:error, :unauthorized}
    end
  end

  defp do_login(nil, _) do
    Comeonin.Bcrypt.dummy_checkpw()
    {:error, :not_found}
  end
end
