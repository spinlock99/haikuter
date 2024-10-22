defmodule Haikuter.Posts.Micropost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "microposts" do
    field :context, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(micropost, attrs) do
    micropost
    |> cast(attrs, [:context])
    |> validate_required([:context])
  end
end
