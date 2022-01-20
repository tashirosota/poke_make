defmodule MagicalMake.Make do
  @moduledoc """
  Performs operations related to the Make command.
  """
  @make "make"
  @asc_word "※"
  @pin_word "@"
  @make_y_range 1..8
  @make_x_range 0..100
  @circle_x_center 75
  @ciercle_y_make_start 30
  @font elem(Chisel.Font.load("priv/assets/5x8.bdf"), 1)

  @doc """
  Check for exists makefile.
  ## Examples
      iex> MagicalMake.Make.make_check!
      :ok # When Makefile exists
  """
  @spec make_check! :: :ok
  def make_check! do
    System.find_executable(@make) ||
      raise MagicalMake.MakefileMissing,
        message: "Makefile does not exist. Must exist in current directory."

    :ok
  end

  @doc """
  Executes make command.
  ## Examples
      iex> MagicalMake.Make.exec_make("hello")
      # exec make command
      :ok # Succeed
  """
  @spec exec_make(String.t()) :: :ok
  def exec_make(command) do
    MagicalMake.SystemCommand.exec(
      @make,
      [command |> to_string()],
      into: IO.stream(:stdio, :line)
    )
  end

  @doc """
  Draws Make command for ascii art.
  ## Examples
      iex> MagicalMake.Make.draw_make("hello")
      :ok # Succeed
  """
  @spec draw_make(String.t(), String.t(), non_neg_integer()) :: :ok
  def draw_make(circle_text, make_command, interval) do
    create_make_art(circle_text, make_command)
    |> MagicalMake.Painter.draw(interval)
  end

  defp create_make_art(circle_text, make_command) do
    make_texts = create_make_texts(make_command)

    circle_text
    |> String.split("\n")
    |> REnum.with_index(fn text, index ->
      if index >= @ciercle_y_make_start && index < @ciercle_y_make_start + REnum.count(make_texts) do
        make_texts |> REnum.at(index - @ciercle_y_make_start)
      else
        text
      end
    end)
    |> REnum.join("\n")
  end

  defp create_make_texts(make_command) do
    {pixels, _, _} =
      Chisel.Renderer.reduce_draw_text(
        @make <> " " <> make_command,
        0,
        0,
        @font,
        [],
        fn x, y, pixels -> [{x, y} | pixels] end
      )

    make_texts =
      REnum.map(@make_y_range, fn y ->
        REnum.map(@make_x_range, fn x ->
          if REnum.member?(pixels, {x, y}), do: @asc_word, else: " "
        end) ++ ["\n"]
      end)

    make_x_center = max_x_length(make_texts) |> div(2)
    space_count = @circle_x_center - make_x_center
    spaces = REnum.map(0..(space_count - 1), fn _ -> " " end)
    fin_make_texts = make_texts |> REnum.map(fn words -> spaces ++ words end)

    [_ | tail] =
      (create_partition() ++ fin_make_texts ++ create_partition())
      |> REnum.join()
      |> String.split("\n")
      |> REnum.reverse()

    tail |> REnum.reverse()
  end

  defp create_partition() do
    REnum.map(0..(@circle_x_center * 2 - 1), fn _ -> "=" end) ++ ["\n"]
  end

  defp max_x_length(make_text) do
    reversed_longest_words =
      make_text
      |> REnum.min_by(fn make_words ->
        make_words
        |> REnum.reverse()
        |> REnum.find_index(fn word -> word == @asc_word end)
      end)
      |> REnum.reverse()

    index = reversed_longest_words |> REnum.find_index(fn word -> word == @asc_word end)

    reversed_longest_words
    |> List.replace_at(index, @pin_word)
    |> REnum.reverse()
    |> REnum.find_index(fn word -> word == @pin_word end)
  end
end
