defmodule Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      build_embedded: Mix.env === :prod,
      deps: deps(),
      dialyzer: [
        flags: [
          "-Wunmatched_returns",
          "-Werror_handling",
          "-Wrace_conditions",
          "-Wunderspecs",
        ],
        plt_add_apps: [:mix, :ex_unit],
        plt_add_deps: :transitive,
      ],
      preferred_cli_env: [coveralls: :test],
      start_permanent: Mix.env === :prod,
      test_coverage: [tool: ExCoveralls],
    ]
  end

  defp deps do
    [
      {:credo, "~> 0.5", only: [:dev, :test]},
      {:dialyxir, "~> 0.4", only: [:dev]},
      {:excoveralls, "~> 0.5", only: :test},
    ]
  end
end
