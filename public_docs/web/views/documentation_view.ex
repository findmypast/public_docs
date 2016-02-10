defmodule PublicDocs.DocumentationView do
    use PublicDocs.Web, :view

  def xsapi_documentation(_conn) do
    {:ok, body} = File.read(Application.app_dir(:public_docs, "priv/static") <> "/xsapi_documentation.md")
    Earmark.to_html(body)
  end

  def hints_documentation(_conn) do
    {:ok, body} = File.read(Application.app_dir(:public_docs, "priv/static") <> "/hintsapi_documentation.md")
    Earmark.to_html(body)
  end
end