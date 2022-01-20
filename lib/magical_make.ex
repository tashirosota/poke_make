defmodule MagicalMake do
  @moduledoc """
  Main module for poke_make.
  """
  import MagicalMake.Circle, only: [draw_circle: 2]
  import MagicalMake.Font, only: [create_decoration: 0]
  import MagicalMake.Make, only: [exec_make: 1, make_check!: 0, draw_make: 3]
  @versoin "0.1.0"
  @interval 200
  @final_interval 1000

  @doc """
  Draw magical circle and exec the given `make_command`.
  ## Examples
      iex> MagicalMake.execute("hello")
      # Draws magical_circle ascii art in stdout
      # exec `make hello`
      :ok
  """
  @spec execute(String.t()) :: :ok
  def execute(make_command) do
    make_check!()
    font_decoration = create_decoration()

    draw_circle(@interval, font_decoration)
    |> draw_make(make_command, @final_interval)

    exec_make(make_command)
    :ok
  end

  @doc """
  Can get current magical make version.
  ## Examples
      iex> MagicalMake.version
      "0.1.0"
  """
  @spec version :: String.t()
  def version do
    @versoin
  end
end
