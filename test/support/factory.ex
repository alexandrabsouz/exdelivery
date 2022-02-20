defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{
    Item,
    Order
  }

  alias Exlivery.Users.User

  def user_factory do
    %{
      name: "Peixonalta Aquatico",
      email: "peixonalta_aquatico@email.com",
      cpf: "45634578698",
      age: 23,
      address: "Mar Vermelho, Lado A"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de Peperoni",
      quantity: 1,
      unity_price: Decimal.new("34.78")
    }
  end

  def order_factory do
    %Order{
      delivery_adress: "Mar Vermelho, Lado A",
      items: [
        %Item{
          category: :pizza,
          description: "Pizza de Peperoni",
          quantity: 1,
          unity_price: Decimal.new("34.78")
        },
        %Item{
          category: :japonesa,
          description: "Yakisoba",
          quantity: 2,
          unity_price: Decimal.new("12.56")
        }
      ],
      total_price: Decimal.new("59.90"),
      user_cpf: "45634578698"
    }
  end
end
