defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{name: "marciorasf", email: "marciorasf_test@gmail.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "marciorasf_test@gmail.com",
                 "id" => _id,
                 "name" => "marciorasf"
               }
             } = response
    end

    test "when all there are invalid params, returns an error", %{conn: conn} do
      params = %{email: "marciorasf_test@gmail.com"}
      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
