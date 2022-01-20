defmodule MagicalMake.Painter do
  @moduledoc """
  Puts ascii arts and refreshs stdout.
  """
  import MagicalMake.SystemCommand

  @doc """
  Draw text with each interval.
  ## Examples
      iex> MagicalMake.Painter.draw("hello", 100)
      # Draws hellp with each 100ms
      :ok
  """
  @spec draw(String.t(), non_neg_integer()) :: :ok
  def draw(text, interval) do
    IO.puts(text)
    Process.sleep(interval)
    refresh!()
    :ok
  end

  @doc """
  Refreshes stdout and font information.
  ## Examples
      iex> MagicalMake.Painter.refresh!
      :ok
  """
  @spec refresh! :: :ok
  def refresh! do
    :font_reset |> sys_cmd()
    :clear |> sys_cmd()
    :ok
  end
end
