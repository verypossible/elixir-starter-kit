defmodule WebDelivery do
  use Application

  alias WebDelivery.Endpoint

  ## Callbacks

  def start(_type, _args) do
    import Supervisor.Spec

    Supervisor.start_link [supervisor(Endpoint, [])],
      strategy: :one_for_one,
      name: WebDelivery.Supervisor
  end

  @spec config_change(keyword, keyword, [atom]) :: :ok
  def config_change(changed, _new, removed) do
    Endpoint.config_change(changed, removed)
    :ok
  end
end
