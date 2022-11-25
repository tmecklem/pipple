defmodule Pipple.RipplingClientCase do
  @moduledoc """
  Case for tests that require configuration of the client to point to a fake Rippling API server for testing
  """

  use ExUnit.CaseTemplate
  alias Pipple.FakeRipplingServer

  setup do
    start_supervised(
      {Plug.Cowboy, scheme: :http, plug: FakeRipplingServer, options: [port: 4007]}
    )

    client = Pipple.client("api_token", "http://localhost:4007/platform/api")
    {:ok, client: client}
  end
end
