defmodule Haikuter.PostsTest do
  use Haikuter.DataCase

  alias Haikuter.Posts

  describe "microposts" do
    alias Haikuter.Posts.Micropost

    import Haikuter.PostsFixtures

    @invalid_attrs %{context: nil}

    test "list_microposts/0 returns all microposts" do
      micropost = micropost_fixture()
      assert Posts.list_microposts() == [micropost]
    end

    test "get_micropost!/1 returns the micropost with given id" do
      micropost = micropost_fixture()
      assert Posts.get_micropost!(micropost.id) == micropost
    end

    test "create_micropost/1 with valid data creates a micropost" do
      valid_attrs = %{context: "some context"}

      assert {:ok, %Micropost{} = micropost} = Posts.create_micropost(valid_attrs)
      assert micropost.context == "some context"
    end

    test "create_micropost/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_micropost(@invalid_attrs)
    end

    test "update_micropost/2 with valid data updates the micropost" do
      micropost = micropost_fixture()
      update_attrs = %{context: "some updated context"}

      assert {:ok, %Micropost{} = micropost} = Posts.update_micropost(micropost, update_attrs)
      assert micropost.context == "some updated context"
    end

    test "update_micropost/2 with invalid data returns error changeset" do
      micropost = micropost_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_micropost(micropost, @invalid_attrs)
      assert micropost == Posts.get_micropost!(micropost.id)
    end

    test "delete_micropost/1 deletes the micropost" do
      micropost = micropost_fixture()
      assert {:ok, %Micropost{}} = Posts.delete_micropost(micropost)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_micropost!(micropost.id) end
    end

    test "change_micropost/1 returns a micropost changeset" do
      micropost = micropost_fixture()
      assert %Ecto.Changeset{} = Posts.change_micropost(micropost)
    end
  end
end
