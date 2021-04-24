defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "marciorasf", email: "marciorasf@gmail.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{name: "marciorasf", email: "marciorasf@gmail.com"},
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "m", email: ""}

      expected_response = %{
        name: ["should be at least 2 character(s)"],
        email: ["can't be blank"]
      }

      response = Restaurant.changeset(params)

      assert %Changeset{
               valid?: false
             } = response

      assert errors_on(response) == expected_response
    end
  end
end
