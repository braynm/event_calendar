defmodule Event.Schema.Event do
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type Ecto.UUID

  schema "events" do
    field :title, :string
    field :description, :string
    field :start_datetime, :naive_datetime
    field :end_datetime, :naive_datetime
    belongs_to :user, Event.Schema.User
  end

  def build(params) do
    changeset(%Event.Schema.Event{}, params)
  end


  defp changeset(event, params \\ []) do
    event
    |> cast(params, [:title, :description, :start_datetime, :end_datetime])
    |> validate_required([:title, :description, :start_datetime, :end_datetime])
    |> validate_interval
    # |> assoc_constraint(:user)
  end

  # Custom validator
  # TODO: Make function reusable
  defp validate_interval(changeset) do
    {:ok, start_date} = Ecto.DateTime.cast(get_field(changeset, :start_datetime))
    {:ok, end_date} = Ecto.DateTime.cast(get_field(changeset, :end_datetime))

    case Ecto.DateTime.compare(start_date, end_date) do
      :gt -> add_error(changeset, :start_datetime, "Invalid date")
      _ -> changeset
    end

  end
end
