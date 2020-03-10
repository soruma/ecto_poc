defmodule EctoPoc.Repo do
  use Ecto.Repo,
    otp_app: :ecto_poc,
    adapter: Ecto.Adapters.Postgres
end
