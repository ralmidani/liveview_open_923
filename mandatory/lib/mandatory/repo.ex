defmodule Mandatory.Repo do
  use Ecto.Repo,
    otp_app: :mandatory,
    adapter: Ecto.Adapters.Postgres
end
