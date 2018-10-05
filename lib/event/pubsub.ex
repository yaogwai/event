defmodule Event.Pubsub do
  def child_spec(_opts) do
    Registry.child_spec(
      keys: :duplicate,
      name: __MODULE__,
      partitions: System.schedulers_online()
    )
  end

  @spec subscribe(String.t()) :: {:ok, pid()}
  def subscribe(event) when is_binary(event) do
    {:ok, _} = Registry.register(__MODULE__, event, [])
  end

  @spec trigger(Event.Type.t()) :: :ok
  def trigger(%Event.Type{} = event) do
    Registry.dispatch(__MODULE__, event.name, fn subscribers ->
      for {pid, _} <- subscribers do
        GenServer.call(pid, {:event, event})
      end
    end)
  end
end
