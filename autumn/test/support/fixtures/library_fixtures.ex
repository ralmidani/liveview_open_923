defmodule Autumn.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Autumn.Library` context.
  """

  @doc """
  Generate a reading.
  """
  def reading_fixture(attrs \\ %{}) do
    {:ok, reading} =
      attrs
      |> Enum.into(%{
        name: "some name",
        phrase: "some phrase",
        steps: 42
      })
      |> Autumn.Library.create_reading()

    reading
  end
end
