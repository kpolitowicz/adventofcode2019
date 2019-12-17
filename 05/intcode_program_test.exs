ExUnit.start

Code.require_file "intcode_program.exs", __DIR__

defmodule IntcodeProgramTest do
  use ExUnit.Case

  test "converts comma-separated string into a tuple" do
    string = "1,2,3\n"
    assert {1,2,3} = IntcodeProgram.read_from(string)
  end

  test "runs the program" do
    assert {{2,0,0,0,99}, []} = IntcodeProgram.run({1,0,0,0,99})
    assert {{2,3,0,6,99}, []}= IntcodeProgram.run({2,3,0,3,99})
    assert {{2,4,4,5,99,9801}, []} = IntcodeProgram.run({2,4,4,5,99,0})
    assert {{30,1,1,4,2,5,6,0,99}, []} = IntcodeProgram.run({1,1,1,4,99,5,6,0,99})

    # new opcodes: 3 and 4
    assert {{3,0,4,0,99}, [42]} = IntcodeProgram.run({3,0,4,0,99}, [42])
  end
end
