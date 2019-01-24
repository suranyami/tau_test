defmodule TauTest.Repo do
  use Ecto.Repo,
    otp_app: :tau_test,
    adapter: Ecto.Adapters.Postgres
end
