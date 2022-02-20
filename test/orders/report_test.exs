defmodule Exlivery.Orders.ReportTest do
    use ExUnit.Case

    import Exlivery.Factory

    alias Exlivery.Orders.Agent, as: OrderAgent
    alias Exlivery.Orders.Report

    describe "create/1" do
        test "creates the report file" do
            OrderAgent.start_link(%{})

            :order 
            |> build()
            |> OrderAgent.save()

            :order 
            |> build()
            |> OrderAgent.save()

            expected_response = "45634578698,  pizza, 1, 34.78, japonesa, 2, 12.56,, 59.90\n" <> "45634578698,  pizza, 1, 34.78, japonesa, 2, 12.56,, 59.90\n"

            Report.create("report_test.csv")

            response = File.read!("report_test.csv")

            assert response == expected_response
        end
    end
    
end