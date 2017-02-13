defmodule Event.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :user_id, references(:users, type: :uuid)
      add :title, :string
    end
  end
end
