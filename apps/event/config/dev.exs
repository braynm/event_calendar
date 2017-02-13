use Mix.Config

config :event, Event.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "event_calendar_#{Mix.env}",
  hostname: "localhost"
