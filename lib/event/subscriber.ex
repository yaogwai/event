defmodule Event.Subscriber do
  defmacro __using__(_opts) do
    quote do
      use GenServer
    end
  end
end
