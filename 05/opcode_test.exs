ExUnit.start

Code.require_file "opcode.exs", __DIR__

defmodule OpcodeTest do
  use ExUnit.Case

  test "converts integer opcode to tuple with modes" do
    expected = %Opcode{
      opcode: 2,
      arg1_mode: 0,
      arg2_mode: 1,
      arg3_mode: 0
    }
    assert ^expected = Opcode.read(1002)
  end
end

