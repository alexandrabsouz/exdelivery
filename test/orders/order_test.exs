defmodule Exlivery.Orders.OrderTeste do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all parameters are válid, returns an order" do
      user = build(:user)

      item = [
        build(:item),
        build(:item,
          category: :japonesa,
          description: "Yakisoba",
          quantity: 2,
          unity_price: Decimal.new("12.56")
        )
      ]

      response = Order.build(user, item)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when there is not items in the order, returns an error" do
      user = build(:user)
      items = []

      response = Order.build(user, items)

      expected_response = {:error, "inválid parameters"}

      assert response == expected_response
    end
  end
end
