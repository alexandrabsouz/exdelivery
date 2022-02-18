defmodule Exlivery.Users.UserTeste do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Mar Vermelho, Lado A",
          "Peixonalta Aquatico",
          "peixonalta_aquatico@email.com",
          "45634578698",
          23
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are inválid parameters" do
      response =
        User.build(
          "Rua Peixoto",
          "Peixonalta Peixe Jr.",
          "peixe_aquatico@email.com",
          "38594034298",
          10
        )

      expected_response = {:error, "inválid parameters"}

      assert response == expected_response
    end
  end
end
