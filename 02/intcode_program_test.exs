ExUnit.start

Code.require_file "intcode_program.exs", __DIR__

defmodule BinariesTest do
  use ExUnit.Case

  test "printable?" do
    assert Binaries.printable?('abc') == true
  end
end
