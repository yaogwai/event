defmodule EventTest do
  use ExUnit.Case

  test "create event" do
    event = Event.new("foo")
    assert event.name == "foo"
    assert event.date == nil
    assert event.data == nil
  end
end
