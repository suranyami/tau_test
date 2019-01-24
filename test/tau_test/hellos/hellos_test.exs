defmodule TauTest.HellosTest do
  use TauTest.DataCase

  alias TauTest.Hellos

  describe "hello" do
    alias TauTest.Hellos.Hello

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def hello_fixture(attrs \\ %{}) do
      {:ok, hello} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Hellos.create_hello()

      hello
    end

    test "list_hello/0 returns all hello" do
      hello = hello_fixture()
      assert Hellos.list_hello() == [hello]
    end

    test "get_hello!/1 returns the hello with given id" do
      hello = hello_fixture()
      assert Hellos.get_hello!(hello.id) == hello
    end

    test "create_hello/1 with valid data creates a hello" do
      assert {:ok, %Hello{} = hello} = Hellos.create_hello(@valid_attrs)
      assert hello.name == "some name"
    end

    test "create_hello/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hellos.create_hello(@invalid_attrs)
    end

    test "update_hello/2 with valid data updates the hello" do
      hello = hello_fixture()
      assert {:ok, %Hello{} = hello} = Hellos.update_hello(hello, @update_attrs)
      assert hello.name == "some updated name"
    end

    test "update_hello/2 with invalid data returns error changeset" do
      hello = hello_fixture()
      assert {:error, %Ecto.Changeset{}} = Hellos.update_hello(hello, @invalid_attrs)
      assert hello == Hellos.get_hello!(hello.id)
    end

    test "delete_hello/1 deletes the hello" do
      hello = hello_fixture()
      assert {:ok, %Hello{}} = Hellos.delete_hello(hello)
      assert_raise Ecto.NoResultsError, fn -> Hellos.get_hello!(hello.id) end
    end

    test "change_hello/1 returns a hello changeset" do
      hello = hello_fixture()
      assert %Ecto.Changeset{} = Hellos.change_hello(hello)
    end
  end
end
