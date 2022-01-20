defmodule MagicalMake.MakeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest MagicalMake.SystemCommand

  test "make_check!/0" do
    assert MagicalMake.SystemCommand.make_check!() == :ok
  end

  test "exec_make/1" do
    execute = fn ->
      MagicalMake.SystemCommand.exec_make("hello")
    end

    assert capture_io(execute) =~ text
    assert execute.() == :ok
  end

  test "draw_make/3" do
    text = "AAA"

    execute = fn ->
      MagicalMake.SystemCommand.draw_make(text, text, 0)
    end

    assert capture_io(execute) =~ "*"
    refute capture_io(execute) =~ text
    assert execute.() == :ok
  end
end
