defmodule EctoPoc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: EctoPoc.Worker.start_link(arg)
      # {EctoPoc.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EctoPoc.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
