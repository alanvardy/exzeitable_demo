defmodule ExzeitableDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ExzeitableDemoWeb.Telemetry,
      # Start the Ecto repository
      ExzeitableDemo.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ExzeitableDemo.PubSub},
      # Start Finch
      {Finch, name: ExzeitableDemo.Finch},
      # Start the Endpoint (http/https)
      ExzeitableDemoWeb.Endpoint
      # Start a worker by calling: ExzeitableDemo.Worker.start_link(arg)
      # {ExzeitableDemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExzeitableDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ExzeitableDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
