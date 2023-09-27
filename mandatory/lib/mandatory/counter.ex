defmodule Mandatory.Counter do
  def new(str) when is_binary(str) do
    String.to_integer(str)
  end

  def add(int_1, int_2 \\ 1) do
    int_1 + int_2
  end

  def show(int) do
    inspect(int)
  end
end
