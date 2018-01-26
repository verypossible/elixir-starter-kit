defmodule WebDelivery.Mixfile do
  use Mix.Project

  def project do
    [
      app: :web_delivery,
      build_embedded: Mix.env() === :prod,
      build_path: "../../_build",
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      config_path: "../../config/config.exs",
      deps: deps(),
      deps_path: "../../deps",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      lockfile: "../../mix.lock",
      preferred_cli_env: [coveralls: :test],
      start_permanent: Mix.env() === :prod,
      test_coverage: [tool: ExCoveralls],
      version: "0.0.1"
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:excoveralls, "~> 0.5", only: :test},
      {:gettext, "~> 0.11"},
      {:phoenix, "~> 1.2.1"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:phoenix_pubsub, "~> 1.0"},
      {:rollbax, "~> 0.8.0"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  def application, do: [mod: {WebDelivery, []}, extra_applications: [:logger]]
end
