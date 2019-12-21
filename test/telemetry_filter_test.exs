defmodule TelemetryFilterTest do
  use ExUnit.Case

  alias Plug.Conn

  describe "TelemetryFilter" do
    test "should attach before_send callback for Plug.Telemetry for non filtered routes" do
      conn = %Conn{request_path: "/users/12345"}

      filter_plug_opts =
        TelemetryFilter.init(filter_endpoints: ["/metrics", "/health"], event_prefix: [:phoenix, :endpoint])

      [before_send] = TelemetryFilter.call(conn, filter_plug_opts).before_send
      assert Function.info(before_send, :module) == {:module, Plug.Telemetry}
    end

    test "should attach before_send callback for Plug.Telemetry when no configured filters are provided" do
      conn = %Conn{request_path: "/users/12345"}
      filter_plug_opts = TelemetryFilter.init(event_prefix: [:phoenix, :endpoint])

      [before_send] = TelemetryFilter.call(conn, filter_plug_opts).before_send
      assert Function.info(before_send, :module) == {:module, Plug.Telemetry}
    end

    test "should not attach before_send callback for Plug.Telemetry for filtered routes" do
      conn = %Conn{request_path: "/metrics"}

      filter_plug_opts =
        TelemetryFilter.init(filter_endpoints: ["/metrics", "/health"], event_prefix: [:phoenix, :endpoint])

      assert [] == TelemetryFilter.call(conn, filter_plug_opts).before_send
    end
  end
end
