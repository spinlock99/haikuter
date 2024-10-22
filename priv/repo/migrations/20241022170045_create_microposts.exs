defmodule Haikuter.Repo.Migrations.CreateMicroposts do
  use Ecto.Migration

  def change do
    create table(:microposts) do
      add :context, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:microposts, [:user_id])
  end
end
