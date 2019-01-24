defmodule TauTestWeb.PageController do
  use TauTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
