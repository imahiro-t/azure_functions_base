defmodule AzureFunctionsBase.MixProject do
  use Mix.Project

  def project do
    [
      app: :azure_functions_base,
      version: "0.1.2",
      elixir: "~> 1.9",
      name: "AzureFunctionsBase",
      description: description(),
      package: package(),
      build_embedded: true,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/imahiro-t/azure_functions_base",
      docs: [
        main: "readme", # The main page in the docs
        extras: ["README.md"]
      ]
    ]
  end

  defp description do
    "Base library to create Elixir Azure Functions"
  end

  defp package do
    [ 
      maintainers: ["erin"],
      licenses: ["MIT"],
      links: %{ "Github" => "https://github.com/imahiro-t/azure_functions_base" }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:plug_cowboy, "~> 2.3"},
      {:httpoison, "~> 1.7.0"},
      {:jason, "~> 1.2"}
    ]
  end
end
