defmodule Mandatory.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MandatoryWeb.Telemetry,
      # Start the Ecto repository
      Mandatory.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mandatory.PubSub},
      # Start Finch
      {Finch, name: Mandatory.Finch},
      # Start the Endpoint (http/https)
      MandatoryWeb.Endpoint
      # Start a worker by calling: Mandatory.Worker.start_link(arg)
      # {Mandatory.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mandatory.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MandatoryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
