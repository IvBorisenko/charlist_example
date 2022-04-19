defmodule CharlistWeb.ErrorView do
  use CharlistWeb, :view

  def render("404.json", %{}) do
    %{errors: ["Not found"]}
  end
end
