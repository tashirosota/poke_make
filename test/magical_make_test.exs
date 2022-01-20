defmodule MagicalMakeTest do
  use ExUnit.Case
  doctest MagicalMake

  test ".execute" do
    cmd = "hello"

    assert MagicalMake.execute(cmd) == :ok
  end
end
