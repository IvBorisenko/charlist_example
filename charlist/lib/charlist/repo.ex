defmodule Charlist.Repo do
  use Ecto.Repo,
    otp_app: :charlist,
    adapter: Ecto.Adapters.Postgres
end
