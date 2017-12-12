defmodule HttpServerTest do
  use ExUnit.Case

  alias Servy.HttpServer

  test "accepts a request on a socket and sends back a response" do
    spawn(HttpServer, :start, [4000])

    paths = [
      "/wildthings",
      "/wildlife",
      "/bears",
      "/bears/1",
      "/api/bears",
      "/about",
    ]

    paths
    |> Enum.map(fn(path) -> "http://localhost:4000#{path}" end)
    |> Enum.map(&Task.async(fn -> HTTPoison.get(&1) end))
    |> Enum.map(&Task.await/1)
    |> Enum.map(&assert_successful_response/1)
  end

  defp assert_successful_response({:ok, response}) do
    assert response.status_code == 200
  end
end
