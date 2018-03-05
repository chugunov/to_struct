defmodule Product do
  defstruct id: nil,
    quantity: nil,
    name: nil
end

defmodule Cart do
  defstruct id: nil,
    user_id: nil,
    products: nil,
    info: nil
end

defmodule ToStructTest do
  use ExUnit.Case
  doctest ToStruct

  test "transform should convert map to struct" do
    map = %{
      "id" => 1,
      "user_id" => 51,
      "products" => [
        %{
          "id" => 33,
          "quantity" => 1,
          "name" => "milk"
        },
        %{
          "id" => 34,
          "quantity" => 5,
          "name" => "potato",
          "extra_field" => "foo_bar"
        }
      ],
      "one_more_extra_field" => "foo_bar",
      "info" => %{
        "date" => "2018-03-05 07:30:55" 
      }
    }

    schema = %Cart{
      products: [%Product{}],
    }

    expected = %Cart{
      id: 1,
      user_id: 51,
      products: [
        %Product{
          id: 33,
          quantity: 1,
          name: "milk"
        },
        %Product{
          id: 34,
          quantity: 5,
          name: "potato",
        }
      ],
      info: %{
        "date" => "2018-03-05 07:30:55" 
      }
    }

    assert ToStruct.transform(schema, map) == expected
  end
end
