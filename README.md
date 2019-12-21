# TelemetryFilter

[![Hex.pm](https://img.shields.io/hexpm/v/telemetry_filter.svg)](http://hex.pm/packages/telemetry_filter) [![Build Status](https://travis-ci.org/akoutmos/telemetry_filter.svg?branch=master)](https://travis-ci.org/akoutmos/telemetry_filter)

The purpose of this library is to filter out routes that shouldn't trigger
Plug Telemetry events. This is useful for when you have routes where you
do not Telemetry events triggered as not to pollute logs or metrics. For
example, this may be useful when you are using something like Kubernetes or
Prometheus and do not want your logs polluted with calls to "/health" and
"/metrics" every 5 seconds (or how ever long the interval is set).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `telemetry_filter` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:telemetry_filter, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/telemetry_filter](https://hexdocs.pm/telemetry_filter).
