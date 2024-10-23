defmodule Haikuter.Repo.Migrations.CreateMicroposts do
  use Ecto.Migration

  def change do
    create table(:microposts) do
      add :content, :text

      timestamps(type: :utc_datetime)
    end
  end
end
