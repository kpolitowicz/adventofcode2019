ExUnit.start

defmodule BinariesTest do
  use ExUnit.Case

  test "printable?" do
    assert Binaries.printable?('abc') == true
  end
end
