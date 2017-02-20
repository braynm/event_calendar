defmodule Event.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :user_id, references(:users, type: :uuid)
      add :title, :string
      add :description, :string
      add :start_datetime, :naive_datetime
      add :end_datetime, :naive_datetime
    end
  end
end
