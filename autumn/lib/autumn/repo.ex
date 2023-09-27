defmodule Autumn.Repo do
  use Ecto.Repo,
    otp_app: :autumn,
    adapter: Ecto.Adapters.Postgres
end
