defmodule Exlivery.Users.UserTeste do
  use ExUnit.Case
  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      address = "Rua Peixoto"
      name = "Peixonalta Peixe"
      email = "peixe_aquatico@email.com"
      cpf = "38594034298"
      age = 18

      response = User.build(address, name, email, cpf, age)

      expected_response = {
        :ok,
        %User{
          address: "Rua Peixoto",
          age: 18,
          cpf: "38594034298",
          email: "peixe_aquatico@email.com",
          name: "Peixonalta Peixe"
        }
      }

      assert response == expected_response
    end

    test "when there are inválid parameters" do
      address = "Rua Peixoto"
      name = "Peixonalta Peixe Jr."
      email = "peixe_aquatico@email.com"
      cpf = "38594034298"
      age = 10

      response = User.build(address, name, email, cpf, age)
      expected_response = {:error, "inválid parameters"}

      assert response == expected_response
    end
  end
end
