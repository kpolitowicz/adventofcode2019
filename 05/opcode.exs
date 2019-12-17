defmodule Opcode do
  def read(opcode_int) do
    opcode = rem(opcode_int, 100)
    arg1_mode = rem(div(opcode_int, 100), 10)
    arg2_mode = rem(div(opcode_int, 1000), 10)
    arg3_mode = rem(div(opcode_int, 10000), 10)

    {opcode, arg1_mode, arg2_mode, arg3_mode}
  end
end

