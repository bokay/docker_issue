defmodule ExampleTest do
  use ExUnit.Case, async: true
  doctest Example

  use Plug.Test

  @opts Example.init([])

  test "returns hello world" do
    # Create a test connection
    conn = conn(:get, "/hello")

    # Invoke the plug
    conn = Example.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello world"
  end
end
