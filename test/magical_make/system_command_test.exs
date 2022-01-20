defmodule MagicalMake.SystemCommandTest do
  use ExUnit.Case
  doctest MagicalMake.SystemCommand

  test "sys_cmd/1" do
    assert MagicalMake.SystemCommand.sys_cmd(:clear) == :ok
    assert MagicalMake.SystemCommand.sys_cmd(:font_reset) == :ok

    assert_raise KeyError, fn ->
      MagicalMake.SystemCommand.sys_cmd(:test)
    end
  end

  test "exec/3" do
    assert MagicalMake.SystemCommand.exec(
             "make",
             ["hello"],
             into: IO.stream(:stdio, :line)
           ) == :ok
  end
end
