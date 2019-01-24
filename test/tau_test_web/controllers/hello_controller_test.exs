defmodule TauTestWeb.HelloControllerTest do
  use TauTestWeb.ConnCase

  alias TauTest.Hellos
  alias TauTest.Hellos.Hello

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:hello) do
    {:ok, hello} = Hellos.create_hello(@create_attrs)
    hello
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all hello", %{conn: conn} do
      conn = get(conn, Routes.hello_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create hello" do
    test "renders hello when data is valid", %{conn: conn} do
      conn = post(conn, Routes.hello_path(conn, :create), hello: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.hello_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.hello_path(conn, :create), hello: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update hello" do
    setup [:create_hello]

    test "renders hello when data is valid", %{conn: conn, hello: %Hello{id: id} = hello} do
      conn = put(conn, Routes.hello_path(conn, :update, hello), hello: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.hello_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, hello: hello} do
      conn = put(conn, Routes.hello_path(conn, :update, hello), hello: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete hello" do
    setup [:create_hello]

    test "deletes chosen hello", %{conn: conn, hello: hello} do
      conn = delete(conn, Routes.hello_path(conn, :delete, hello))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.hello_path(conn, :show, hello))
      end
    end
  end

  defp create_hello(_) do
    hello = fixture(:hello)
    {:ok, hello: hello}
  end
end
