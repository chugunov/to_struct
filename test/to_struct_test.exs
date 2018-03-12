defmodule Product do
  defstruct id: nil,
            quantity: nil,
            name: nil
end

defmodule Cart do
  defstruct id: nil,
            user_id: nil,
            products: nil,
            other_info: [],
            info: nil
end

defmodule Keys.Mongo.Relation do
  defmodule Id do
    defstruct ti: nil,
              fi: nil
  end

  defstruct _id: nil,
            maxPrice: nil,
            submissionCloseDate: nil,
            submissionCloseDateTime: nil,
            isChanged: false,
            isDeleted: false,
            isRead: false,
            kind: nil,
            placingWay: nil,
            publicationDate: nil,
            publicationDateTime: nil,
            receiveDate: nil,
            receiveDateTime: nil,
            smp: nil,
            marks: [],
            keys: [],
            users: []
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
<<<<<<< HEAD
      },
      "other_info" => []
=======
      }
>>>>>>> 39f864589c51de29b15612f76ced7a18e6d1ae56
    }

    schema = %Cart{
      products: [%Product{}]
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
          name: "potato"
        }
      ],
      info: %{
        "date" => "2018-03-05 07:30:55"
      }
    }

    assert ToStruct.transform(schema, map) == expected
  end
end
