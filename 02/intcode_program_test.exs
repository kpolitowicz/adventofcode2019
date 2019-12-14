ExUnit.start

Code.require_file "intcode_program.exs", __DIR__

defmodule IntcodeProgramTest do
  use ExUnit.Case

  test "printable?" do
    assert IntcodeProgram.printable?('abc') == true
  end
end
