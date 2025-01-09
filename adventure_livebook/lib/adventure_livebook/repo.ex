defmodule AdventureLivebook.Repo do
  use Ecto.Repo,
    otp_app: :adventure_livebook,
    adapter: Ecto.Adapters.Postgres
end
