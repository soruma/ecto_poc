import Config

config :ecto_poc, EctoPoc.Repo,
  database: "ecto_poc_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :ecto_poc, ecto_repos: [EctoPoc.Repo]
