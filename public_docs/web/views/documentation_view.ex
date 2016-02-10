defmodule PublicDocs.DocumentationView do
    use PublicDocs.Web, :view

  def documentation(_conn) do
    {:ok, body} = File.read(Application.app_dir(:public_docs, "priv/static") <> "/documentation.md")
    Earmark.to_html(body)
  end
end