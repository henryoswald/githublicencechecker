defmodule GithublicencerWeb.PageController do
  use GithublicencerWeb, :controller

  def index(conn, _params) do
		IO.puts("hellllo world")
		# client = Tentacat.Client.new
		# IO.inspect(conn)#
		# i = Tentacat.Users.find "henryoswald", client
		# Tentacat.Organizations.Members
		# Tentacat.Repositories.list_public()
		# IO.inspect(i)
		IO.inspect(get_session(conn, :current_user))
    render conn, "index.html"
  end
end
