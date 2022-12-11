defmodule Pipple.Employee do
  @moduledoc """
  This struct represents an Employee in Rippling
  """

  use TypedStruct

  typedstruct do
    field(:id, String.t())
    field(:name, String.t())
    field(:last_name, String.t())
    field(:first_name, String.t())
    field(:title, String.t())
    field(:department, String.t())
    field(:custom_fields, list())
    field(:updated_at, DateTime.t())
    field(:created_at, DateTime.t())
    field(:start_date, Date.t())
    field(:manager, String.t())
  end

  def new(%{
        "id" => id,
        "name" => name,
        "firstName" => first_name,
        "lastName" => last_name,
        "title" => title,
        "department" => department,
        "customFields" => custom_fields,
        "updatedAt" => updated_at,
        "createdAt" => created_at,
        "startDate" => start_date,
        "manager" => manager
      }) do
    struct(
      __MODULE__,
      %{
        id: id,
        name: name,
        first_name: first_name,
        last_name: last_name,
        title: title,
        department: department,
        custom_fields: custom_fields,
        updated_at: Timex.parse!(updated_at, "{ISO:Extended}"),
        created_at: Timex.parse!(created_at, "{ISO:Extended}"),
        start_date: Timex.parse!(start_date, "%Y-%m-%d", :strftime),
        manager: manager
      }
    )
  end

  def new(map) do
    struct(__MODULE__, map)
  end
end
