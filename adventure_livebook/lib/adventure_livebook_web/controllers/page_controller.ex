defmodule AdventureLivebookWeb.PageController do
  use AdventureLivebookWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
