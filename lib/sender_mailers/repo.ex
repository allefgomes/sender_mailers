defmodule SenderMailers.Repo do
  use Ecto.Repo,
    otp_app: :sender_mailers,
    adapter: Ecto.Adapters.Postgres
end
