defmodule Mandatory.CounterTest do
  use ExUnit.Case

  alias Mandatory.Counter

  describe "new/1" do
    test "it returns zero when zero is passed in" do
      assert Counter.new("0") == 0
    end

    test "it returns positive integers when they are passed in" do
      assert Counter.new("1") == 1
    end
  end

  describe "crc" do
    test "the pipeline works" do
      expected = "1"
      actual =
        "0"
        |> Counter.new()
        |> assert_count(0)
        |> Counter.add(1)
        |> assert_count(1)
        |> Counter.show()

      assert actual == expected
    end
  end

  def assert_count(counter, expected) do
    assert counter == expected
    counter
  end
end