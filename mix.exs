defmodule BoosterKit.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      build_embedded: Mix.env === :prod,
      deps: deps(),
      preferred_cli_env: [coveralls: :test],
      start_permanent: Mix.env == :prod,
      test_coverage: [tool: ExCoveralls],
    ]
  end

  defp deps do
    [
      {:excoveralls, "~> 0.5", only: :test},
    ]
  end
end
