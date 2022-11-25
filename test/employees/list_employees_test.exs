defmodule Pipple.Employees.ListEmployeesTest do
  @moduledoc false
  use Pipple.RipplingClientCase

  alias Pipple.{
    Employee,
    Employees
  }

  describe "list_employees" do
    test "it forms a correct request and returns a list of employees", %{client: client} do
      assert {:ok,
              [
                %Employee{name: "Tradothy Marklem", department: "Hot Air"}
                | _
              ]} = Employees.list_employees(client)
    end
  end
end
