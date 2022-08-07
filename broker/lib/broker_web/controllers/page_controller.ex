defmodule BrokerWeb.PageController do
  use BrokerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
