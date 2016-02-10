defmodule PublicDocs.DocumentationController do
  use PublicDocs.Web, :controller

  def docs(conn, _params) do
    render(conn, "docs.html")
  end
end