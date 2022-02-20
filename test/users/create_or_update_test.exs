defmodule Exlivery.Users.CreateOrUpdateTest do
    use ExUnit.Case

    alias Exlivery.Users.Agent, as: UserAgent
    alias Exlivery.Users.CreateOrUpdate, as: CreateOrUpdateUser

    describe "call/1" do
        setup do
            UserAgent.start_link(%{})
            :ok
        end

        test "when all params are valid, saves the user" do
            params = %{name: "Alexandra Souza", address: "Rua do Infinito", email: "alexa@email.com", cpf: "00000000000", age: 23}

            response = CreateOrUpdateUser.call(params)

            expected_response = {:ok, "user info has been saved"}

            assert response == expected_response
        end

        test "when  params are valid, saves the user" do
            params = %{name: "Alexandra Souza", address: "Rua do Infinito", email: "alexa@email.com", cpf: "00000000000", age: 10}

            response = CreateOrUpdateUser.call(params)

            expected_response = {:error, "inválid parameters"}

            assert response == expected_response
        end
        
    end
end