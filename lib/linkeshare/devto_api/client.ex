defmodule DevToApi.Client do
  @moduledoc """
  Integration with DevTo API
  https://docs.microsoft.com/pt-br/linkedin/consumer
  """

  alias LinkedinApi.Client, as: LinkedinApi

  @spec share(map) :: {:error, any} | {:ok, String.t() | Tesla.Env.t()}
  def share(params) do
    params
    |> parse()
    |> filter_article_type()
    |> post_share()
  end

  defp parse(%{"data" => %{"attributes" => result}}), do: result

  defp filter_article_type(%{"event_type" => "article_created"} = result) do
    result =
      result
      |> get_in(["payload", "data", "attributes"])

    {:ok, result}
  end

  defp filter_article_type(_result), do: {:error, "Must be article_created"}

  defp post_share({:ok, %{"title" => title, "url" => url}}) do
    %{
      title: title,
      url: url,
      service: "Dev.to"
    }
    |> LinkedinApi.share_article()
  end

  defp post_share({:error, _reason} = error), do: error
end
