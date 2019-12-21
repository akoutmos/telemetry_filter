defmodule TelemetryFilter.MixProject do
  use Mix.Project

  def project do
    [
      app: :telemetry_filter,
      version: "0.1.0",
      elixir: "~> 1.9",
      name: "TelemetryFilter",
      source_url: "https://github.com/akoutmos/telemetry_filter",
      homepage_url: "https://hex.pm/packages/telemetry_filter",
      description: "Simple Plug to filter out configured telemetry events",
      start_permanent: Mix.env() == :prod,
      docs: [
        main: "readme",
        extras: ["README.md"]
      ],
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package() do
    [
      name: "telemetry_filter",
      files: ~w(lib mix.exs README.md LICENSE CHANGELOG.md),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/akoutmos/telemetry_filter"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.8"},
      {:telemetry, "~> 0.4"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
