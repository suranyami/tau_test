defmodule TauTestWeb.HelloView do
  use TauTestWeb, :view
  alias TauTestWeb.HelloView

  def render("index.json", %{hello: hello}) do
    %{data: render_many(hello, HelloView, "hello.json")}
  end

  def render("show.json", %{hello: hello}) do
    %{data: render_one(hello, HelloView, "hello.json")}
  end

  def render("hello.json", %{hello: hello}) do
    %{name: hello}
  end
end
