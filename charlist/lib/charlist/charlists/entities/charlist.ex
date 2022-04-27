defmodule Charlist.Charlists.Entities.CharlistEntity do
  use Ecto.Schema

  import Ecto.Changeset

  alias Charlist.Accounts.Entities.User
  alias Charlist.Items.Entities.Item
  alias Charlist.Repo

  @required [
    :wisdom,
    :strength,
    :dexterity,
    :charisma,
    :constitution,
    :intelligence,
    :nickname,
    :user_id
  ]

  schema "charlists" do
    field :wisdom, :integer
    field :strength, :integer
    field :dexterity, :integer
    field :charisma, :integer
    field :constitution, :integer
    field :intelligence, :integer
    field :nickname, :string

    belongs_to :user, User

    many_to_many :items, Item, join_through: "charlists_items"

    timestamps()
  end

  def create_changeset(%__MODULE__{} = charlist, attrs) do
    charlist
    |> Repo.preload(:items)
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> validate_number(:wisdom, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:strength, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:dexterity, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:charisma, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:constitution, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:intelligence, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> assoc_constraint(:user)
    |> unique_constraint(:nickname)
    # Set the association
    |> put_assoc(:items, [attrs.items])
  end

  def update_changeset(%__MODULE__{} = charlist, attrs) do
    charlist
    |> Repo.preload(:items)
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> validate_number(:wisdom, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:strength, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:dexterity, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:charisma, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:constitution, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:intelligence, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> assoc_constraint(:user)
    |> unique_constraint(:nickname)
    # Set the association
    |> put_assoc(:items, [attrs.items])
  end
end
