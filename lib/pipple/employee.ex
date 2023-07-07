defmodule Pipple.Employee do
  @moduledoc """
  This struct represents an Employee in Rippling
  """

  use TypedStruct

  typedstruct do
    field(:created_at, DateTime.t())
    field(:custom_fields, list())
    field(:department, String.t())
    field(:first_name, String.t())
    field(:id, String.t())
    field(:last_name, String.t())
    field(:manager, String.t())
    field(:name, String.t())
    field(:preferred_first_name, String.t())
    field(:preferred_last_name, String.t())
    field(:start_date, Date.t())
    field(:title, String.t())
    field(:updated_at, DateTime.t())
  end

  def new(
        %{
          "createdAt" => created_at,
          "customFields" => custom_fields,
          "department" => department,
          "firstName" => first_name,
          "id" => id,
          "lastName" => last_name,
          "manager" => manager,
          "name" => name,
          "startDate" => start_date,
          "title" => title,
          "updatedAt" => updated_at
        } = response
      ) do
    struct(
      __MODULE__,
      %{
        created_at: Timex.parse!(created_at, "{ISO:Extended}"),
        custom_fields: custom_fields,
        department: department,
        first_name: first_name,
        id: id,
        last_name: last_name,
        manager: manager,
        name: name,
        preferred_first_name: Map.get(response, "preferredFirstName", nil),
        preferred_last_name: Map.get(response, "preferredLastName", nil),
        start_date: Timex.parse!(start_date, "%Y-%m-%d", :strftime),
        title: title,
        updated_at: Timex.parse!(updated_at, "{ISO:Extended}")
      }
    )
  end

  def new(map) do
    struct(__MODULE__, map)
  end
end
