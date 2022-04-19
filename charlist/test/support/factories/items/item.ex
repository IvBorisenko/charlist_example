defmodule Charlist.Factories.Items.ItemFactory do
  defmacro __using__(_opts) do
    quote do
      alias Faker.{Internet, Lorem, Person}
      alias Charlist.Items.Entities.Item

      def item_factory(attrs) do
        cost = Map.get(attrs, :cost, Enum.random(1..20))
        weight = Map.get(attrs, :weight, Enum.random(1..20))
        armor = Map.get(attrs, :armor)
        damage = Map.get(attrs, :damage)
        description = Map.get(attrs, :description, Lorem.sentence(10..20))
        name = Map.get(attrs, :name, Internet.user_name())
        hidden = Map.get(attrs, :hidden, false)

        %Item{
          name: sequence(:name, &"#{name}_#{&1}"),
          cost: cost,
          weight: weight,
          armor: armor,
          damage: damage,
          description: description,
          hidden: hidden
        }
      end
    end
  end
end
