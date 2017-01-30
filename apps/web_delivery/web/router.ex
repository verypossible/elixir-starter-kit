defmodule WebDelivery.Router do
  use WebDelivery.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WebDelivery do
    pipe_through :api # Use the default browser stack

    get "/", StatusController, :index
  end
end
