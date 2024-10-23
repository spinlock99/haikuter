defmodule Haikuter.Posts.Micropost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "microposts" do
    field :content, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(micropost, attrs) do
    micropost
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
