defmodule Haikuter.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Haikuter.Posts` context.
  """

  @doc """
  Generate a micropost.
  """
  def micropost_fixture(attrs \\ %{}) do
    {:ok, micropost} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> Haikuter.Posts.create_micropost()

    micropost
  end
end
