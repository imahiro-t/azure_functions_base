defmodule AzureFunctionsBase.Application do

  use Application

  alias AzureFunctionsBase.Logger

  def start(_type, _args) do
    context = System.get_env
    port = context |> Map.get("FUNCTIONS_CUSTOMHANDLER_PORT", "4444") |> String.to_integer
    children = [
      {Logger, context |> Map.get("LOG_LEVEL", "INFO") |> String.downcase |> String.to_atom},
      {Plug.Cowboy, scheme: :http, plug: AzureFunctionsBase.Base, options: [port: port]},
    ]
    Supervisor.start_link(children, strategy: :one_for_all)
  end

end
