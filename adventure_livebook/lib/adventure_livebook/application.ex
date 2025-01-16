defmodule AdventureLivebook.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AdventureLivebook.Repo,
      # Start the Telemetry supervisor
      AdventureLivebookWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AdventureLivebook.PubSub},
      # Start the Endpoint (http/https)
      AdventureLivebookWeb.Endpoint,
      # Start a worker by calling: AdventureLivebook.Worker.start_link(arg)
      # {AdventureLivebook.Worker, arg}
      {AdventureLivebook.Notifications, ["todos_changes"], id: :todos_changes}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AdventureLivebook.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AdventureLivebookWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
