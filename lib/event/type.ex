# defmodule Event.Type do
#   @enforce_keys [:name]
#   defstruct [:name, :data, :date]
#   @type t :: %Event.Type{name: String.t(), data: any, date: DateTime.t()}

#   @spec new(String.t(), any()) :: __MODULE__.t()
#   def new(name, data \\ nil), do: %__MODULE__{name: name, data: data}
# end

defprotocol Event.Type do
  def get_time(event)
  def set_time(event, time)
  def get_name(event)
end

defimpl Event.Type, for: Map do
  # time when the event was sent
  def get_time(map), do: map.time
  def set_time(map, time), do: %{map | time: time}
  def get_name(map), do: map.name
end
