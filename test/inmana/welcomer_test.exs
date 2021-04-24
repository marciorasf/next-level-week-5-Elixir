defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special return a message" do
      params = %{"name" => "marciorasf", "age" => "22"}
      expected_result = {:ok, "Welcome marciorasf"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the use has less than 18 years, returns an error" do
      params = %{"name" => "marciorasf", "age" => "15"}
      expected_result = {:error, "You shall not pass marciorasf!"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
