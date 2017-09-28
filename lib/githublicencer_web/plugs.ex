

defmodule GithublicencerWeb.Plugs.RequireUser do
  import Plug.Conn

  def init(opts) do; opts; end;
  def call(conn, _opts) do
    if Plug.Conn.get_session(conn, :current_user) do
      conn
    else
      # TODO: figure out how to redirect to our login page
      conn
      |> Plug.Conn.send_resp(401, "unauthorized")
      |> halt()
    end
  end
end