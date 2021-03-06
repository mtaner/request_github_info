# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :request_github_info,
  ecto_repos: [RequestGithubInfo.Repo]

# Configures the endpoint
config :request_github_info, RequestGithubInfo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bm81t0aphm+lrL1dfGTBP97kRyqEKVaS/wBKad8BTrR6n565ePBtWV8k46miSFGY",
  render_errors: [view: RequestGithubInfo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RequestGithubInfo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :request_github_info, RequestGithubInfo.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.gmail.com",
  port: 465,
  username: System.get_env("ENV_VAR_EMAIL"),
  password: System.get_env("ENV_VAR_PASSWORD"),
  tls: :if_available, # can be `:always` or `:never`
  ssl: true, # can be `true`
  retries: 5



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
