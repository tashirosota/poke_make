defmodule MagicalMake.PainterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest MagicalMake.SystemCommand

  test "draw/2" do
    text = "AAAAAAAAA"

    execute = fn ->
      MagicalMake.Painter.draw(text, 100)
    end

    assert capture_io(execute) =~ text
    assert execute.() == :ok
  end

  test "refresh!/0" do
    execute = fn ->
      MagicalMake.Painter.refresh!()
    end

    assert capture_io(execute) =~ "'\e[2J\e[3J\e[H'"
    assert execute.() == :ok
  end
end
