defmodule Payfy.Repo do
  use Ecto.Repo,
    otp_app: :payfy,
    adapter: Ecto.Adapters.Postgres
end
