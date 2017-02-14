defmodule Event.Schema.Event do
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type Ecto.UUID

  schema "events" do
    field :title, :string
    belongs_to :user, Event.Schema.User
  end

  def build(params) do
    Event.Schema.Event.changeset(%Event.Schema.Event{}, params)
  end


  def changeset(event, params \\ []) do
    event
    |> cast(params, [:title])
    |> validate_required(:title)
    |> assoc_constraint(:user)
  end
end
