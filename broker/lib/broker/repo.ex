defmodule Broker.Repo do
  use Ecto.Repo,
    otp_app: :broker,
    adapter: Ecto.Adapters.Postgres
end
