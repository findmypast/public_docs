defmodule PublicDocs.PageController do
  use PublicDocs.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
