ExUnit.start

Code.require_file "opcode.exs", __DIR__

defmodule OpcodeTest do
  use ExUnit.Case

  test "converts integer opcode to tuple with modes" do
    assert {2, 0, 1, 0} = Opcode.read(1002)
  end
end

