defmodule OtpDemo.Repo do
  use Ecto.Repo,
    otp_app: :otp_demo,
    adapter: Ecto.Adapters.Postgres
end
