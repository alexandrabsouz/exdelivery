defmodule Exlivery.Orders.Item do
  @categories [
    :pizza,
    :hamburguer,
    :sobremesa,
    :carne,
    :prato_feito,
    :japonesa
  ]

  @keys [:description, :category, :unity_price, :quantity]

  @enforce_keys @keys

  defstruct @keys

  def build(description, category, unity_price, quantity)
      when quantity > 0 and category in @categories do
        unity_price
        |> Decimal.cast()
        |> build_item(description, category, quantity)
  end

  def build(_description, _category, _unity_price, _quantity) do
    {:error, "inválid parameters"}
  end

  defp build_item({:ok, unity_price}, description, category, quantity) do
    {:ok,
     %__MODULE__{
       description: description,
       category: category,
       unity_price: unity_price,
       quantity: quantity
     }}
  end

  defp build_item(:error, description, category, quantity), do: {:error, "inválid price"}
end

# alias Exlivery.Orders.Item
# Item.build("Pizza de Peperoni", :pizza, 50.00, 1)
