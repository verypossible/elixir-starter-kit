defmodule WebDelivery.ErrorView do
  use WebDelivery.Web, :view

  def render("404.json", _assigns), do: ~s({"error":"Not found"})

  def render("500.json", _assigns), do: ~s({"error":"Internal server error"})

  def template_not_found(_template, assigns), do: render("500.json", assigns)
end
