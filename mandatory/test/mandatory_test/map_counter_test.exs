defmodule MandatoryTest.MapCounterTest do
  use ExUnit.Case
  alias Mandatory.MapCounter

  describe "map counter" do
    test "new/1" do
      assert MapCounter.new("42") == %{counter: 42}
    end

    test "add/2" do
      map = %{counter: 42}
      assert MapCounter.add(map) == %{counter: 43}
    end

    test "show/1" do
      map = %{counter: 43}
      assert MapCounter.show(map) == "The map ants ARRR is #{map.counter}!!"
    end
  end
end
