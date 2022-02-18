defmodule Exlivery.Orders.ItemTeste do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "When all params are válid returnb an item " do
      response = Item.build("Pizza de Peperoni", :pizza, "34.78", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an inválid category, returns an error" do
      response = Item.build("Pizza de Peperoni", :banana, "34.78", 1)

      expected_response = {:error, "inválid parameters"}

      assert response == expected_response
    end

    test "when there is a quantity small for one, returns an error" do
      response = Item.build("Pizza de Peperoni", :pizza, "34.78", 0)

      expected_response = {:error, "inválid parameters"}

      assert response == expected_response
    end

    test "when there is an inválid price, returns an error" do
      response = Item.build("Pizza de Peperoni", :pizza, "banana", 1)

      expected_response =  {:error, "inválid price"}
      
      assert response == expected_response
    end
  end
end
