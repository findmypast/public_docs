defmodule PublicDocs.DocumentationController do
  use PublicDocs.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def xsapi_docs(conn, _params) do
    render(conn, "xsapi_docs.html")
  end

  def hints_docs(conn, _params) do
    render(conn, "hints_docs.html")
  end

  def image_docs(conn, _params) do
    render(conn, "image_docs.html")
  end
end