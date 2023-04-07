defmodule PhxPlaygroundWeb.HelloController do
  use PhxPlaygroundWeb, :controller

  def index(conn, _params) do
    conn
    |> put_layout(html: :root)
    |> render(:index)
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, :show, messenger: messenger)
  end
end
