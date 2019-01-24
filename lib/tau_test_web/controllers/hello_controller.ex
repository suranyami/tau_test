defmodule TauTestWeb.HelloController do
  use TauTestWeb, :controller

  alias TauTest.Hellos
  alias TauTest.Hellos.Hello

  action_fallback TauTestWeb.FallbackController

  def index(conn, _params) do
    hello = Hellos.list_hello()
    render(conn, "index.json", hello: hello)
  end

  def create(conn, %{"name" => name}) do
    render(conn, "show.json", hello: name)
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.json", hello: id)
  end

  def update(conn, %{"id" => id, "hello" => hello_params}) do
    hello = Hellos.get_hello!(id)

    with {:ok, %Hello{} = hello} <- Hellos.update_hello(hello, hello_params) do
      render(conn, "show.json", hello: hello)
    end
  end

  def delete(conn, %{"id" => id}) do
    hello = Hellos.get_hello!(id)

    with {:ok, %Hello{}} <- Hellos.delete_hello(hello) do
      send_resp(conn, :no_content, "")
    end
  end
end
