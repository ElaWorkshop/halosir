defmodule HaloSir.Mixfile do
  use Mix.Project

  def project do
    [app: :halosir,
     version: "1.0.0",
     elixir: "~> 1.5",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  def application do
    [mod: {HaloSir, []},
     applications: [:phoenix, :phoenix_pubsub, :cowboy, :logger, :gettext,
                    :httpotion, :fluxter]]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  defp deps do
    [{:phoenix, "~> 1.2.0"},
     {:phoenix_pubsub, "~> 1.0"},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:httpotion, "~> 3.0.0"},
     {:fluxter, "~> 0.6"},
     {:credo, "~> 0.8", only: :dev},
     {:bypass, "~> 0.8", only: [:dev, :test]},
    ]
  end

  defp aliases() do
    [
      "test": ["cleanup_testdata", "test"],
    ]
  end
end
