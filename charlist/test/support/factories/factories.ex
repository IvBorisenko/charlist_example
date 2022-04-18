defmodule Charlist.Factories do
  use ExMachina.Ecto, repo: Charlist.Repo

  use Charlist.Factories.{
    Accounts.UserFactory,
    Charlists.CharlistFactory,
    Items.ItemFactory
  }
end
