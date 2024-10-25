defmodule Haikuter.Repo.Migrations.DropMicroposts do
  use Ecto.Migration

  def change do
    drop table(:microposts)
  end
end
