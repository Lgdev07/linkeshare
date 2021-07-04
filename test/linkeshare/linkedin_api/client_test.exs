defmodule LinkedinApi.ClientTest do
  use LinkeshareWeb.ConnCase

  alias LinkedinApi.Client
  alias LinkedinApi.Client.Adapter.Mock

  import Mox
  import LinkeshareWeb.Support.DevToSupport

  describe "share_article/1" do
    test "return ok because the request was a success" do
      Mock
      |> expect(:call, &response_200/2)

      assert {:ok, result} =
               Client.share_article(%{
                 title: "Test Title",
                 url: "Test Url",
                 service: "Test Service"
               })

      assert Map.get(result, :status) == 200
    end

    test "return error because the request failed" do
      Mock
      |> expect(:call, &response_401/2)

      assert {:error, result} =
               Client.share_article(%{
                 title: "Test Title",
                 url: "Test Url",
                 service: "Test Service"
               })

      assert Map.get(result, :status) == 401
    end
  end
end
