defmodule MagicalMake.FontTest do
  use ExUnit.Case
  doctest MagicalMake.SystemCommand

  test "create_decoration/0" do
    assert MagicalMake.Font.create_decoration() =~ "\e"
  end
end
