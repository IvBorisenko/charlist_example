defmodule Charlist.Items.Entities.Item do
  use Ecto.Schema

  import Ecto.Changeset

  alias Charlist.Charlists.Entities.Charlist

  @required [
    :name,
    :cost,
    :weight
  ]

  schema "items" do
    field :name, :string
    field :description, :string
    field :cost, :integer
    field :weight, :integer
    field :armor, :integer
    field :damage, :integer

    many_to_many :charlists, Charlist, join_through: "charlists_items"

    timestamps()
  end

  def create_changeset(%__MODULE__{} = item, attrs) do
    item
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> validate_number(:cost, greater_than_or_equal_to: 0)
    |> validate_number(:weight, greater_than_or_equal_to: 0)
    |> unique_constraint(:name, message: "taken")
  end
end
