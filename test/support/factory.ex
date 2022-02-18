defmodule Exlivery.Factory do
    use ExMachina
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
end