defmodule PhxPlayground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxPlaygroundWeb.Telemetry,
      # Start the Ecto repository
      PhxPlayground.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxPlayground.PubSub},
      # Start Finch
      {Finch, name: PhxPlayground.Finch},
      # Start the Endpoint (http/https)
      PhxPlaygroundWeb.Endpoint
      # Start a worker by calling: PhxPlayground.Worker.start_link(arg)
      # {PhxPlayground.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxPlaygroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
