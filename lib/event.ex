defmodule Event do
  defdelegate new(name), to: Event.Type
  defdelegate trigger(event), to: Event.Pubsub
  defdelegate subscribe(event), to: Event.Pubsub
end
