defmodule MagicalMake.Font do
  @moduledoc """
  Create font information for stdout.
  It is likely to be expanded in the future.
  """
  @esc "\e"
  @colors [
    black: "#{@esc}[30m",
    red: "#{@esc}[31m",
    green: "#{@esc}[32m",
    yellow: "#{@esc}[33m",
    blue: "#{@esc}[34m",
    magenta: "#{@esc}[35m",
    cyan: "#{@esc}[36m"
  ]

  @doc """
  Get random color code for stdout.
  ## Examples
      iex> MagicalMake.Font.create_decoration()`
      "\e[36m"
  """
  @spec create_decoration :: String.t()
  def create_decoration() do
    @colors |> Keyword.values() |> REnum.random()
  end
end
