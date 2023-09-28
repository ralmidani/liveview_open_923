defmodule Autumn.LibraryTest do
  use Autumn.DataCase

  alias Autumn.Library

  describe "readings" do
    alias Autumn.Library.Reading

    import Autumn.LibraryFixtures

    @invalid_attrs %{name: nil, phrase: nil, steps: nil}

    test "list_readings/0 returns all readings" do
      reading = reading_fixture()
      assert Library.list_readings() == [reading]
    end

    test "get_reading!/1 returns the reading with given id" do
      reading = reading_fixture()
      assert Library.get_reading!(reading.id) == reading
    end

    test "create_reading/1 with valid data creates a reading" do
      valid_attrs = %{name: "some name", phrase: "some phrase", steps: 42}

      assert {:ok, %Reading{} = reading} = Library.create_reading(valid_attrs)
      assert reading.name == "some name"
      assert reading.phrase == "some phrase"
      assert reading.steps == 42
    end

    test "create_reading/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_reading(@invalid_attrs)
    end

    test "update_reading/2 with valid data updates the reading" do
      reading = reading_fixture()
      update_attrs = %{name: "some updated name", phrase: "some updated phrase", steps: 43}

      assert {:ok, %Reading{} = reading} = Library.update_reading(reading, update_attrs)
      assert reading.name == "some updated name"
      assert reading.phrase == "some updated phrase"
      assert reading.steps == 43
    end

    test "update_reading/2 with invalid data returns error changeset" do
      reading = reading_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_reading(reading, @invalid_attrs)
      assert reading == Library.get_reading!(reading.id)
    end

    test "delete_reading/1 deletes the reading" do
      reading = reading_fixture()
      assert {:ok, %Reading{}} = Library.delete_reading(reading)
      assert_raise Ecto.NoResultsError, fn -> Library.get_reading!(reading.id) end
    end

    test "change_reading/1 returns a reading changeset" do
      reading = reading_fixture()
      assert %Ecto.Changeset{} = Library.change_reading(reading)
    end
  end
end
