defmodule SenderMailers.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SenderMailers.Repo,
      # Start the Telemetry supervisor
      SenderMailersWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SenderMailers.PubSub},
      # Start the Endpoint (http/https)
      SenderMailersWeb.Endpoint,
      # Start a worker by calling: SenderMailers.Worker.start_link(arg)
      # {SenderMailers.Worker, arg}
      {Oban, Application.fetch_env!(:sender_mailers, Oban)}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SenderMailers.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SenderMailersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
