defmodule MagicalMake.MixProject do
  use Mix.Project
  @versoin "0.1.0"
  @source_url "https://github.com/tashirosota/poke_make"
  @description "Decorate your make commands with Pokémons"

  def project do
    [
      app: :poke_make,
      version: @versoin,
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript(),
      description: @description,
      name: "PokemonMake",
      source_url: @source_url,
      package: package(),
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp escript do
    [main_module: MagicalMake.CLI, name: :poke]
  end

  defp package() do
    [
      files: ["lib", "priv", "mix.*", "README.md"],
      licenses: ["Apache-2.0"],
      maintainers: ["Sota Tashiro"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp deps do
    [
      {:chisel, "~> 0.2.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:r_enum, "~> 0.2"}
    ]
  end
end
