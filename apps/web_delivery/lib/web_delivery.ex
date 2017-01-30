defmodule WebDelivery do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    Supervisor.start_link [supervisor(WebDelivery.Endpoint, [])],
      strategy: :one_for_one,
      name: WebDelivery.Supervisor
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WebDelivery.Endpoint.config_change(changed, removed)
    :ok
  end
end
