defmodule AzureFunctionsBase do
  @moduledoc """
  This is azure functions base.
  Use AzureFunctionsBase and implement `handle(event, context)` function
  """

  alias AzureFunctionsBase.Request
  alias AzureFunctionsBase.Response

  @doc """
  Azure runtime call init function.
  """
  @callback init(context :: map()) :: :ok

  @doc """
  Azure runtime call handle function.
  """
  @callback handle(request :: Request.t, event :: map(), context :: map()) :: {:ok, Response.t} | {:ok, String.t} | {:error, Response.t} | {:error, String.t}

  defmacro __using__(_opts) do
    quote do
      @behaviour AzureFunctionsBase
    end
  end
end
