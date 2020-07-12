# The book version uses Mix.Config, because at the time it was not deprecated
import Config

config :issues,
  github_url: "https://api.github.com"

config :logger,
  compile_time_purge_level: :info
