defmodule Event do
  defdelegate new(name, data \\ nil), to: Event.Type
  defdelegate trigger(event), to: Event.Pubsub
  defdelegate subscribe(event), to: Event.Pubsub
end
