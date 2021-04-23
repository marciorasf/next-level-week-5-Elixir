defmodule Inmana do
  alias Inmana.{Restaurants, Supplies}

  # Restaurants
  defdelegate create_restaurant(params), to: Restaurants.Create, as: :call

  # Supplies
  defdelegate create_supply(params), to: Supplies.Create, as: :call
  defdelegate get_supply(params), to: Supplies.Get, as: :call
end
