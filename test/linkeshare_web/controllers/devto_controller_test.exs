defmodule LinkeshareWeb.DevToControllerTest do
  use LinkeshareWeb.ConnCase

  alias LinkedinApi.Client.Adapter.Mock

  import Mox
  import LinkeshareWeb.Support.DevToSupport

  setup :verify_on_exit!

  describe "create/2" do
    test "return status 204 because the request was a success", %{conn: conn} do
      Mock
      |> expect(:call, &response_200/2)

      conn = post(conn, Routes.dev_to_path(conn, :create), devto_post_body())
      assert text_response(conn, 204) =~ ""
    end

    test "return status 503 because the request failed", %{conn: conn} do
      Mock
      |> expect(:call, &response_401/2)

      conn = post(conn, Routes.dev_to_path(conn, :create), devto_post_body())
      assert text_response(conn, 503) =~ ""
    end
  end
end
