defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrder
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      Exlivery.start_agents()

      cpf = "34898237487"
      user = build(:user, cpf: cpf)
      UserAgent.save(user)

      item1 = %{
        category: :pizza,
        description: "Pizza de Peperoni",
        quantity: 1,
        unity_price: Decimal.new("34.78")
      }

      item2 = %{
        category: :pizza,
        description: "Pizza de Calabreza",
        quantity: 5,
        unity_price: Decimal.new("17.78")
      }

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, saves the order", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{
        user_cpf: cpf,
        items: [item1, item2]
      }

      response = CreateOrUpdateOrder.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given cpf, returns an error", %{
      item1: item1,
      item2: item2
    } do
      params = %{
        user_cpf: "00000000000",
        items: [item1, item2]
      }

      response = CreateOrUpdateOrder.call(params)

      assert {:error, "User not found"} = response
    end

    test "when quantity <= 0, returns an error", %{user_cpf: cpf, item1: item1, item2: item2} do
      params = %{
        user_cpf: cpf,
        items: [%{item1 | quantity: 0}, item2]
      }

      response = CreateOrUpdateOrder.call(params)

      assert {:error, "Invalid items"} = response
    end

    test "whenasre not items, returns an error", %{user_cpf: cpf} do
      params = %{
        user_cpf: cpf,
        items: []
      }

      response = CreateOrUpdateOrder.call(params)

      assert {:error, "inválid parameters"} = response
    end
  end
end
