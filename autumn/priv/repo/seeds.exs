# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

alias Autumn.Repo
alias Autumn.Library.Reading

now = NaiveDateTime.utc_now |> NaiveDateTime.truncate(:second)

list = [%{inserted_at: now, updated_at: now, name: "Did you try turning it off and on again?", phrase: "war phrase", steps: 2},
        %{inserted_at: now, updated_at: now, name: "The Fly", phrase: "Be afraid. Be very afraid.", steps: 2},
        %{inserted_at: now, updated_at: now, name: "Unknown", phrase: "Perfection is the enemy of good.", steps: 6},
        %{inserted_at: now, updated_at: now, name: "Fast", phrase: "If we have to, overnight parts from Japan.", steps: 3},
        %{inserted_at: now, updated_at: now, name: "Airplane!", phrase: "I'm not joking, and don't call me Shirley.", steps: 4},
        %{inserted_at: now, updated_at: now, name: "Taylor Swift", phrase: "Play stupid games, win stupid prizes.", steps: 4},
        %{inserted_at: now, updated_at: now, name: "Dr. Seuss", phrase: "Don't cry because it's over. Smile because it happens.", steps: 2},
        %{inserted_at: now, updated_at: now, name: "JFK", phrase: "We choose to go to the moon. Not because it is easy, but because it is hard.", steps: 2}
      ]

Repo.insert_all(Reading, list)
