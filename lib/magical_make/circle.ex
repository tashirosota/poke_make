defmodule MagicalMake.Circle do
  @moduledoc """
  For Magic circle's ascii art.
  """
  @last_word "I"
  @gsub_words [
    ".",
    ";",
    "i",
    @last_word
  ]
  @assets_path "priv/assets/circles/"
  # https://elixirforum.com/t/is-it-possible-to-include-resource-files-when-packaging-my-project-using-mix-escript/730/11
  @circle_texts REnum.map(1..15, fn num ->
                  elem(File.read(@assets_path <> to_string(num) <> ".txt"), 1)
                end)
  @doc """
  Puts Magic circle's ascii art and refresh.
  Draws gradually with each words[".", ":", ";", "I", "M"]
  """
  @spec draw_circle(non_neg_integer(), String.t()) :: String.t()
  def draw_circle(interval, font_decoration) do
    circle_txt = @circle_texts |> REnum.random()

    REnum.each(@gsub_words ++ [], fn word ->
      (font_decoration <> String.replace(circle_txt, ~r/\S/, word))
      |> MagicalMake.Painter.draw(interval)
    end)

    font_decoration <> String.replace(circle_txt, ~r/\S/, @last_word)
  end
end
