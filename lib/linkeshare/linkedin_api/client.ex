defmodule LinkedinApi.Client do
  @moduledoc """
  Integration with Linkedin API
  https://docs.microsoft.com/pt-br/linkedin/consumer
  """

  use Tesla

  defp access_token, do: Application.get_env(:linkeshare, :linkedin)[:access_token]
  defp author_id, do: Application.get_env(:linkeshare, :linkedin)[:author_id]

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.BaseUrl, "https://api.linkedin.com/v2"
  plug Tesla.Middleware.Headers, [{"authorization", "Bearer #{access_token()}"}]

  @spec share_article(map) :: {:error, any} | {:ok, String.t() | Tesla.Env.t()}
  def share_article(%{title: title, url: url, service: service}) do
    body = %{
      "author" => "urn:li:person:#{author_id()}",
      "lifecycleState" => "PUBLISHED",
      "specificContent" => %{
        "com.linkedin.ugc.ShareContent" => %{
          "shareCommentary" => %{
            "text" =>
              "Acabei de criar um artigo no #{service} falando sobre #{title}, confere lá 😁"
          },
          "shareMediaCategory" => "ARTICLE",
          "media" => [
            %{
              "status" => "READY",
              "description" => %{
                "text" => title
              },
              "originalUrl" => url,
              "title" => %{
                "text" => title
              }
            }
          ]
        }
      },
      "visibility" => %{
        "com.linkedin.ugc.MemberNetworkVisibility" => "PUBLIC"
      }
    }

    post("/ugcPosts", body)
    |> handle_response()
  end

  defp handle_response({:ok, %Tesla.Env{status: 201}}), do: {:ok, "Created"}
  defp handle_response({:ok, _result} = result), do: result
  defp handle_response({:error, _reason} = error), do: error
end
