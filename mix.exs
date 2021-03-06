defmodule EventCalendar.Mixfile do
  use Mix.Project

  def project do
    [apps_path: "apps",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     aliases: aliases(),
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    [{:ecto, "~> 2.0"},
     {:postgrex, "~> 0.11"},
     {:comeonin, "~> 2.5"}
    ]
  end

  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate"], #"ecto.seed"],
    "ecto.seed": ["run apps/event/priv/repo/seeds.exs"],
    "ecto.reset": ["ecto.drop", "ecto.setup"],
    "test": ["ecto.reset --quiet", "test"]]
  end
end
