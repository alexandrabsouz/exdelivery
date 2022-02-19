defmodule Exlivery do
  # alias Exlivery.Orders.Agent, as: OrderAgent
  # alias Exlivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrders
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate, as: CreateOrUpdateUsers

  def start_agents do
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUsers, as: :call
end
