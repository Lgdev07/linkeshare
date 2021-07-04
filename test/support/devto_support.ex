defmodule LinkeshareWeb.Support.DevToSupport do
  @moduledoc false

  def response_200(
        %{method: :post, url: "https://api.linkedin.com/v2/ugcPosts"},
        _opts
      ) do
    {:ok, %Tesla.Env{status: 200, body: %{"id" => "urn:li:share:1"}}}
  end

  def response_401(
        %{method: :post, url: "https://api.linkedin.com/v2/ugcPosts"},
        _opts
      ) do
    {:error, %Tesla.Env{status: 401, body: %{"status" => "failed"}}}
  end

  def devto_post_body do
    %{
      "data" => %{
        "attributes" => %{
          "event_type" => "article_created",
          "payload" => %{
            "data" => %{
              "attributes" => %{
                "body_html" => "<p>Test Text</p>\n\n",
                "body_markdown" => "Test Text",
                "cached_tag_list" => "",
                "cached_tag_list_array" => [],
                "canonical_url" => "https://dev.to/test/test-2kk1",
                "comments_count" => 0,
                "cover_image" =>
                  "https://res.cloudinary.com/practicaldev/image/fetch/s--lG_zOE4s--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev.to/test/test-2kk1",
                "created_at" => "2021-07-03T17:48:16Z",
                "crossposted_at" => nil,
                "description" => "Test Text",
                "edited_at" => nil,
                "last_comment_at" => "2021-07-03T17:48:16Z",
                "path" => "/test/test-2kk1",
                "public_reactions_count" => 0,
                "published_at" => "2021-07-03T17:48:16Z",
                "readable_publish_date" => "Jul 3",
                "slug" => "test-2kk1",
                "social_image" => "https://dev.to/social_previews/article/747274.png",
                "title" => "Test",
                "url" => "https://dev.to/test/test-2kk1",
                "user" => %{
                  "data" => %{
                    "attributes" => %{
                      "github_username" => "test",
                      "name" => "Test Test",
                      "profile_image" => "Test Test",
                      "profile_image_90" => "Test Test",
                      "twitter_username" => nil,
                      "username" => "test",
                      "website_url" => nil
                    },
                    "id" => "11111",
                    "type" => "user"
                  }
                }
              },
              "id" => "11111",
              "type" => "article"
            }
          },
          "timestamp" => "2021-07-03T17:48:16Z"
        },
        "id" => "11111111111111111111",
        "type" => "webhook_event"
      }
    }
  end
end
