defmodule MagicalMake.CLITest do
  use ExUnit.Case
  doctest MagicalMake.SystemCommand

  test "main" do
    cmd = "hello"
    assert MagicalMake.CLI.main([cmd]) == :ok
    assert MagicalMake.CLI.main(["help"]) == :help
    assert MagicalMake.CLI.main(["-h"]) == :help
    assert MagicalMake.CLI.main(["--help"]) == :help
    assert MagicalMake.CLI.main(["version"]) == :version
    assert MagicalMake.CLI.main(["-v"]) == :version
    assert MagicalMake.CLI.main(["--version"]) == :version
  end
end
