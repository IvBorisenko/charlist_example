defmodule Charlist.Factories.Charlists.CharlistFactory do
  defmacro __using__(_opts) do
    quote do
      alias Charlist.Charlists.Entities.CharlistEntity
      alias Faker.{Internet, Lorem, Person}

      def charlist_factory(attrs) do
        wisdom = Map.get(attrs, :wisdom, Enum.random(1..20))
        strength = Map.get(attrs, :strength, Enum.random(1..20))
        dexterity = Map.get(attrs, :dexterity, Enum.random(1..20))
        charisma = Map.get(attrs, :charisma, Enum.random(1..20))
        constitution = Map.get(attrs, :constitution, Enum.random(1..20))
        intelligence = Map.get(attrs, :intelligence, Enum.random(1..20))
        nickname = Map.get(attrs, :nickname, Internet.user_name())
        user = Map.get(attrs, :user, insert(:user))

        %CharlistEntity{
          nickname: sequence(:nickname, &"#{nickname}_#{&1}"),
          wisdom: wisdom,
          strength: strength,
          dexterity: dexterity,
          charisma: charisma,
          constitution: constitution,
          intelligence: intelligence,
          user: user
        }
      end
    end
  end
end
