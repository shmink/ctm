import Config

config :transactions, ecto_repos: [Transactions.Repo]

config :transactions, Transactions.Repo,
  database: "merchants",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
