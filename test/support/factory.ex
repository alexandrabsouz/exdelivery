defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.Item
  alias Exlivery.Users.User

  def user_factory do
    %User{
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
end
