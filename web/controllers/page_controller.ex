defmodule GraphqlAuth.PageController do
  use GraphqlAuth.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
