defmodule CharlistWeb.V1.ItemControllerTest do
  use CharlistWeb.ConnCase

  import CharlistWeb.Router.Helpers

  setup %{conn: conn} do
    {:ok, %{conn: conn}}
  end

  test "index/2 returns list items", %{conn: conn} do
    [item_1, item_2, item_3] = insert_list(3, :item)

    response =
      conn
      |> get(item_path(conn, :index))
      |> json_response(200)

    assert response ==
             [
               %{"id" => item_1.id, "name" => item_1.name},
               %{"id" => item_2.id, "name" => item_2.name},
               %{"id" => item_3.id, "name" => item_3.name}
             ]
  end
end
