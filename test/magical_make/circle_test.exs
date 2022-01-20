defmodule MagicalMake.CircleTest do
  import MagicalMake.Font, only: [create_decoration: 0]
  use ExUnit.Case
  doctest MagicalMake.Circle

  test "select" do
    font_decoration = create_decoration()
    interval = 100
    assert MagicalMake.Circle.draw_circle(interval, font_decoration) =~ "III"
  end
end
