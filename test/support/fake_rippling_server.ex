defmodule Pipple.FakeRipplingServer do
  @moduledoc """
  Fake (yet also real HTTP) server to handle requests that conform to
  Rippling's api and return responses that look like real Rippling responses.
  """

  use Plug.Router

  import Pipple.{
    FakeEmployeesApiHandler
  }

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/platform/api/employees" do
    conn
    |> put_resp_header("content-type", "application/json;charset=utf-8")
    |> handle_list_employees()
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
