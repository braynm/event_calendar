defmodule Event.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_encrypted, :string
    has_many :events, Event.Schema.Event
    timestamps()
  end

  def build(params) do
    changeset(%Event.Schema.User{}, params)
  end

  defp changeset(user, params \\ []) do
    user
    |> cast(params, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> unique_constraint(:email)
    |> encrypt_pwd
  end

  defp encrypt_pwd(%{changes: %{ password: password }} = changeset) do
    put_change(changeset, :password_encrypted, Comeonin.Bcrypt.hashpwsalt(password))
  end

  defp encrypt_pwd(%{changes: %{}} = changeset) do
    changeset
  end
end
