defmodule Event do
  defdelegate trigger(event), to: Event.Pubsub
  defdelegate subscribe(event), to: Event.Pubsub
end
