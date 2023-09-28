# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

alias Autumn.Repo
alias Autumn.Library.Reading


list = [%Reading{name: "Did you try turning it off and on again?", phrase: "war phrase", steps: 2},
        %Reading{name: "", phrase: "war phrase", steps: 2}]

Enum.each(list, fn map -> Repo.insert!(map) end) |> IO.inspect()
