defmodule Mandatory.MapCounter do

  def new(str), do: %{counter: String.to_integer(str)}

  def add(map, arg \\ 1), do: %{counter: map.counter + arg}

  def show(map), do: "The ants ARRR is #{map.counter}!!"

end
