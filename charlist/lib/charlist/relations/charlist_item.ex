defmodule CharlistItem do
  use Ecto.Schema

  alias Charlist.Charlists.Entities.CharlistEntity
  alias Charlist.Items.Entities.Item

  @primary_key false
  schema "charlists_items" do
    belongs_to :charlist, CharlistEntity
    belongs_to :item, Item

    # Added bonus, a join schema will also allow you to set timestamps
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:charlist_id, :item_id])
    |> Ecto.Changeset.validate_required([:charlist_id, :item_id])
  end
end
