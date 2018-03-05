defmodule ToStruct.MixProject do
  use Mix.Project

  def project do
    [
      app: :to_struct,
      version: String.trim(File.read!("VERSION")),
      description: description(),
      package: package(),
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/chugunov/to_struct"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    Transform map to struct
    """
  end

  defp package do
    [
      name: :to_struct,
      files: ["lib",  "mix.exs", "README*", "LICENSE*", "VERSION"],
      maintainers: ["Andrey Chugunov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/chugunov/to_struct"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:eliver, "~> 2.0", only: :dev}
    ]
  end
end
