defmodule LinkeshareWeb.DevToController do
  use LinkeshareWeb, :controller

  require Logger

  alias DevToApi.Client

  @spec create(Plug.Conn.t(), any) :: Plug.Conn.t()
  def create(conn, params) do
    params
    |> Client.share()
    |> handle_response(conn)
  end

  defp handle_response({:ok, _response}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_response({:error, _response}, conn) do
    conn
    |> put_status(:service_unavailable)
    |> put_resp_header("Retry-After", 120)
    |> text("")
  end
end
