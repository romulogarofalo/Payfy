defmodule Payfy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Payfy.Repo,
      # Start the Telemetry supervisor
      PayfyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Payfy.PubSub},
      # Start the Endpoint (http/https)
      PayfyWeb.Endpoint,
      # Start a worker by calling: Payfy.Worker.start_link(arg)
      # {Payfy.Worker, arg}
      {Oban, Application.fetch_env!(:payfy, Oban)}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Payfy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PayfyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
