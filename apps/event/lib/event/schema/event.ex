defmodule Event.Schema.Event do
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type Ecto.UUID

  schema "events" do
    field :title, :string
    belongs_to :user, Event.Schema.User
  end
end
