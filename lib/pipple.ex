defmodule Pipple do
  @moduledoc """
  This is the entrypoint for making requests to Rippling's API via Pipple
  """

  use Tesla

  defdelegate list_employees(client), to: Pipple.Employees

  def client(api_token, base_url) do
    base_url = process_base(base_url)

    middleware = [
      {Tesla.Middleware.BaseUrl, base_url},
      {Tesla.Middleware.JSON, engine: Jason},
      {Tesla.Middleware.BearerAuth, token: api_token},
      Tesla.Middleware.PathParams
    ]

    Tesla.client(middleware)
  end

  defp process_base(base_url) do
    if Regex.match?(~r/^https?:\/\//i, base_url) do
      base_url
    else
      "https://" <> base_url
    end
  end
end
