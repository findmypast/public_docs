use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :x_search_api, XSearchApi.Endpoint,
  secret_key_base: "j1nF9DNa3CtIi5eX16t05OfYcK72vcvcozp80LHZOc2Zcfph9d1OX8BAAAASUCYk"

# Configure your database
config :x_search_api, XSearchApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "x_search_api_prod",
  pool_size: 20