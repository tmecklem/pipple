defmodule Pipple.Employees do
  @moduledoc """
  This module encapsulates calls to the Rippling employees resource API
  """

  use Tesla

  alias Pipple.Employee
  alias Tesla.Client

  @callback list_employees(Client.t()) :: {:ok, list(Employee.t())}

  def list_employees(%Client{} = client) do
    client
    |> get("/employees")
    |> case do
      {:ok, %Tesla.Env{status: 200, body: employee_list}} ->
        {:ok,
         employee_list
         |> Enum.map(&Employee.new/1)}

      {:error, env} ->
        {:error, env}
    end
  end
end
