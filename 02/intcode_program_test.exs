ExUnit.start

Code.require_file "intcode_program.exs", __DIR__

defmodule IntcodeProgramTest do
  use ExUnit.Case

  test "converts comma-separated string into a tuple" do
    string = "1,2,3"
    assert {1,2,3} = IntcodeProgram.read_from(string)
  end

  test "printable?" do
    assert IntcodeProgram.printable?('abc') == true
  end
end
