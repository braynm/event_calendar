defmodule Event.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset
  
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  schema "users" do
    field :name, :string
    has_many :events, Event.Schema.Event
    timestamps()
  end
end
