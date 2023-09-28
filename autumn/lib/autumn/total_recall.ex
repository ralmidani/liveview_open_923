defmodule Autumn.TotalRecall do
  defstruct phrase: "", step: [], name: "", plan: []

  def new(p, s) do
    # %__MODULE__{phrase: p, step: s, name: n}

    IO.inspect(p)
    IO.inspect(s)
    phrase_length = String.length(p)
    chunk_size = ceil(phrase_length / String.to_integer(s))

    plan =
      1..phrase_length
      |> Enum.shuffle()
      |> Enum.chunk_every(chunk_size)
      |> IO.inspect(label: "Plan")

    %__MODULE__{phrase: String.graphemes(p), step: s, plan: plan}
  end

  def reduce(%__MODULE__{phrase: p, plan: plan, step: s} = t) do
    case plan do
      [current_plan | tail] ->
        new_string =
          for {char, index} <- Enum.with_index(p, 1) do
            if index in current_plan do
              case char do
                " " -> " "
                char -> "_"
              end
            else
              char
            end
          end

        struct(t, phrase: new_string, step: s + 1, plan: tail)

      _ ->
        t
    end
  end

  def show(%__MODULE__{phrase: p}) do
    Enum.join(p)
  end
end
