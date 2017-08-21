# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :GithublicencerWeb,
  ecto_repos: [GithublicencerWeb.Repo]

# Configures the endpoint
config :GithublicencerWeb, GithublicencerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MazceK6jVedNNPvQvUFiZMF08OjLe7lX47nLbGD0zj9pxCfI37nwfxH2AY24HJNq",
  render_errors: [view: GithublicencerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GithublicencerWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
	  providers: [
	    github: { Ueberauth.Strategy.Github, [] }
	  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "Iv1.397e4d58adb2a8c6",
  client_secret: "df276319a907e7bf82ea81095bd21441cd8f8e36"
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
