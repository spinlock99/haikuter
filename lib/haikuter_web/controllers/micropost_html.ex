defmodule HaikuterWeb.MicropostHTML do
  use HaikuterWeb, :html

  embed_templates "micropost_html/*"

  @doc """
  Renders a micropost form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def micropost_form(assigns)
end
