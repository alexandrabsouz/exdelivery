defmodule Exlivery.Users.AgentTest do
    use ExUnit.Case

    alias Exlivery.Users.Agent, as: UserAgent
    alias Exlivery.Users.User

    import Exlivery.Factory

    describe "save/1" do
        test "saves the user" do
            user = build(:user)
            UserAgent.start_link(%{})
            assert UserAgent.save(user) == :ok
        end
    end

    describe "get/1" do
        test "when the user is found, returns the user" do
            UserAgent.start_link(%{})

            :user
            |> build(cpf: "345674556789")
            |> UserAgent.save()

            response = UserAgent.get("345674556789")

            expected_response = {
                :ok,
                %Exlivery.Users.User{address: "Mar Vermelho, Lado A", age: 23, cpf: "345674556789", email: "peixonalta_aquatico@email.com", name: "Peixonalta Aquatico"}
              }

            assert response == expected_response
        end

        test "when the user not found, returns an error" do

            UserAgent.start_link(%{})
            
            response = UserAgent.get("345674556743534")

            expected_response = {:error, "User not found"}

            assert response == expected_response
        end
    end
end