defmodule ExzeitableDemo.Repo do
  use Ecto.Repo,
    otp_app: :exzeitable_demo,
    adapter: Ecto.Adapters.Postgres
end
