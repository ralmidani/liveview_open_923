defmodule Autumn.TotalRecall do
  alias __MODULE__
  defstruct phrase: "", step: 0, name: ""

  def new(phrase: p, step: s, name: n) do
    %__MODULE__{phrase: p, step: s, name: n}
  end

  def reduce(t = %__MODULE__{phrase: p, step: s}) do
    cl = String.to_charlist(p)

    new_string =
      for {letter, index} <- Enum.with_index(cl) do
        if rem(index, 3) == 0 do
          "_"
        else
          letter
        end
      end

    t = struct(t, phrase: p, step: s + 1)
  end
end
