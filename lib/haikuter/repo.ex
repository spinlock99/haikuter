defmodule Haikuter.Repo do
  use Ecto.Repo,
    otp_app: :haikuter,
    adapter: Ecto.Adapters.Postgres
end
