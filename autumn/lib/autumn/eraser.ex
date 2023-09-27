defmodule Autumn.Eraser do
  defstruct [:original_text, :current_text, :steps]

  alias Autumn.Eraser

  @moduledoc """
  text: original text to memorize
  steps: number of times the program will run to erase sections of the text
  """
  def new(text, steps) do

    %Eraser{
      original_text: text,
      current_text: text,
      steps: steps
    }
  end

  def reduce(acc) do
    acc
  end

  def show(acc) do
    acc.current_text
  end


end
