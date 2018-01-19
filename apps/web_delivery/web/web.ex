defmodule WebDelivery.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use WebDelivery.Web, :controller
      use WebDelivery.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end

  def controller do
    quote do
      use Phoenix.Controller

      import WebDelivery.Router.Helpers
      import WebDelivery.Gettext

      @type conn :: Plug.Conn.t()
      @type params :: Plug.Conn.params()
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      import Phoenix.Controller, only: [view_module: 1]

      import WebDelivery.Router.Helpers
      import WebDelivery.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import WebDelivery.Gettext
    end
  end
end
