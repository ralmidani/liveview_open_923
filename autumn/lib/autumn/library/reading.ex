defmodule Autumn.Library.Reading do
  use Ecto.Schema
  import Ecto.Changeset

  schema "readings" do
    field :name, :string
    field :phrase, :string
    field :steps, :integer

    timestamps()
  end

  @doc false
  def changeset(reading, attrs) do
    reading
    |> cast(attrs, [:name, :steps, :phrase])
    |> validate_required([:name, :steps, :phrase])
  end
end
