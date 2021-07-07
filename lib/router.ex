defmodule  HiredHand.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do

    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(200, Jason.encode!("Welcome to the Hired Hand"))
  end
end