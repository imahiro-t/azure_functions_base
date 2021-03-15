# AzureFunctionsBase

Base library to create Elixir Azure Functions

## Installation

The package can be installed by adding `azure_function_base` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:azure_function_base, "~> 0.1.2"}
  ]
end
```

## Basic Usage

1. Create Azure Functions handler module. Implement handle(request, event, context) function.

```elixir
defmodule Upcase do
  use AzureFunctionsBase
  alias AzureFunctionsBase.Logger
  alias AzureFunctionsBase.Request
  alias AzureFunctionsBase.Response
  @impl AzureFunctionsBase
  def init(_context) do
    # call back one time
    :ok
  end
  @impl AzureFunctionsBase
  def handle(%Request{body: body} = request, event, context) do
    Logger.info(event)
    Logger.info(context)
    Logger.info(request)
    {:ok, Response.to_response(body |> Jason.encode! |> String.upcase, %{}, 200)}
    # {:ok, body |> Jason.encode! |> String.upcase}
  end
end
```

2. Create files for Azure Functions.

```
$ handle_module=Upcase
$ method_name=upcase
$ docker run -d -it --rm --name elx erintheblack/elixir-azure-functions-builder:1.10.4
$ docker cp lib elx:/tmp
$ docker cp mix.exs elx:/tmp
$ docker exec elx /bin/bash -c "mix deps.get; MIX_ENV=prod mix azure_functions.release ${handle_module} ${method_name} 'get post'"
$ docker cp elx:/tmp/_build_az_func .
$ docker stop elx
```

3. Publish.

```
$ cd ./_build_az_func
$ func azure functionapp publish ${functionName} --publish-local-settings --overwrite-settings
```

The docs can be found at [https://hexdocs.pm/azure_functions_base](https://hexdocs.pm/azure_functions_base).
