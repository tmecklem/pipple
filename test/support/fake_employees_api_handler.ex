defmodule Pipple.FakeEmployeesApiHandler do
  @moduledoc false

  import Plug.Conn

  def handle_list_employees(conn) do
    response_body = ~s"""
    [
      {
        "id": "5baac7fc3643kh34g5664315",
        "name": "Tradothy Marklem",
        "firstName": "Tradothy",
        "lastName": "Marklem",
        "title": "Software Enginair",
        "department": "Hot Air",
        "spokeId": null,
        "customFields": {
          "Billable Role": "Billable",
          "Support Team": "Erica Gold"
        },
        "updatedAt": "2021-09-29T12:15:55+0000",
        "createdAt": "2015-09-25T23:42:52+0000",
        "startDate": "2010-10-06",
        "manager": "5baac7fc26656445lk4h5491"
      }
    ]
    """

    conn
    |> send_resp(200, response_body)
  end
end
