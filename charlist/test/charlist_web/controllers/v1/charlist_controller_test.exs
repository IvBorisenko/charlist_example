defmodule CharlistWeb.V1.CharlistControllerTest do
  use CharlistWeb.ConnCase

  import CharlistWeb.Router.Helpers

  setup %{conn: conn} do
    user = insert(:user)
    conn = as_user(conn, user)
    {:ok, %{conn: conn, user: user}}
  end

  test "index/2 returns list charlists", %{conn: conn, user: user} do
    [charlist_1, charlist_2, charlist_3] = insert_list(3, :charlist, %{user: user})
    attrs = %{page: 1, page_size: 5}

    response =
      conn
      |> get(charlist_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
             [
               %{"id" => charlist_1.id, "nickname" => charlist_1.nickname},
               %{"id" => charlist_2.id, "nickname" => charlist_2.nickname},
               %{"id" => charlist_3.id, "nickname" => charlist_3.nickname}
             ]
  end

  test "show/2 returns list charlists", %{conn: conn, user: user} do
    charlist = insert(:charlist, %{user: user})

    response =
      conn
      |> get(charlist_path(conn, :show, charlist.id))
      |> json_response(200)

    assert response == %{"id" => charlist.id, "nickname" => charlist.nickname}
  end
end
