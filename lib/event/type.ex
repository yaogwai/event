# defmodule Event.Type do
#   @enforce_keys [:name]
#   defstruct [:name, :data, :date]
#   @type t :: %Event.Type{name: String.t(), data: any, date: DateTime.t()}

#   @spec new(String.t(), any()) :: __MODULE__.t()
#   def new(name, data \\ nil), do: %__MODULE__{name: name, data: data}
# end

defprotocol Event.Type do
  def new(name)
  def get_date(event)
  def set_date(event, date)
  def get_name(event)
end

defimpl Event.Type, for: Map do
  def get_date(map), do: map.date
  def set_date(map, date), do: %{map | date: date}
  def get_name(map), do: map.name
  def new(name), do: %{name: name}
end
