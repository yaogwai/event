defmodule Event.Type do
  @enforce_keys [:name]
  defstruct name: nil, data: nil
  @type t :: %Event.Type{name: String.t(), data: any}

  @spec new(String.t(), any()) :: Event.Type.t()
  def new(name, data \\ nil), do: %__MODULE__{name: name, data: data}
end
