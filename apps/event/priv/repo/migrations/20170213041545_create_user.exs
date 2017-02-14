defmodule Event.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :email, :string
      add :password, :string, virtual: true
      add :password_encrypted, :string
      timestamps()
    end

     create unique_index(:users, :email)
  end
end
