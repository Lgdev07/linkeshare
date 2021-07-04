defmodule Linkeshare.DevToTest do
  use LinkeshareWeb.ConnCase

  alias Linkeshare.DevTo
  alias LinkedinApi.Client.Adapter.Mock

  import Mox
  import LinkeshareWeb.Support.DevToSupport

  describe "share/1" do
    test "return ok because the parameters are correct" do
      Mock
      |> expect(:call, &response_200/2)

      assert {:ok, result} = DevTo.share(devto_post_body())
      assert Map.get(result, :status) == 200
    end

    test "return error because event_type is not article_created" do
      body = %{
        "data" => %{
          "attributes" => %{
            "event_type" => "article_updated"
          }
        }
      }

      assert {:error, "Must be article_created"} == DevTo.share(body)
    end

    test "return error because request failed" do
      Mock
      |> expect(:call, &response_401/2)

      assert {:error, result} = DevTo.share(devto_post_body())
      assert Map.get(result, :status) == 401
    end
  end
end
