use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :public_docs, PublicDocs.Endpoint,
  secret_key_base: "j1nF9DNa3CtIi5eX16t05OfYcK72vcvcozp80LHZOc2Zcfph9d1OX8BAAAASUCYk"

# Configure your database
config :public_docs, PublicDocs.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "public_docs_prod",
  pool_size: 20