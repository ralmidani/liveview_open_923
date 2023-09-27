defmodule Mandatory.CounterStruct do
  defstruct [:count]

  def new(input) when is_binary(input) do
    %__MODULE__{count: String.to_integer(input)}
  end

  def add(%__MODULE__{count: count} = counter, n) when is_integer(n) do
    %{counter | count: count + n}
  end

  def show(%__MODULE__{count: count} = counter) do
    "The ant ARR is #{count}"
  end
end
