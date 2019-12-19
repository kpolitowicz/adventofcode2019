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

    # param modes
    assert {{1002,4,3,4,99}, []} = IntcodeProgram.run({1002,4,3,4,33})
  end

  test "computes output from input (opcodes 3 and 4)" do
    assert [42] = IntcodeProgram.output({3,0,4,0,99}, [42])
  end

  test "computes output with opcodes 5, 6, 7, and 8" do
    # outputs 1 if input == 8, 0 otherwise
    assert [1] = IntcodeProgram.output({3,9,8,9,10,9,4,9,99,-1,8}, [8])
    assert [0] = IntcodeProgram.output({3,9,8,9,10,9,4,9,99,-1,8}, [7])
    assert [1] = IntcodeProgram.output({3,3,1108,-1,8,3,4,3,99}, [8])
    assert [0] = IntcodeProgram.output({3,3,1108,-1,8,3,4,3,99}, [7])

    # outputs 1 if input < 8, 0 otherwise
    assert [0] = IntcodeProgram.output({3,9,7,9,10,9,4,9,99,-1,8}, [8])
    assert [1] = IntcodeProgram.output({3,9,7,9,10,9,4,9,99,-1,8}, [7])
    assert [0] = IntcodeProgram.output({3,3,1107,-1,8,3,4,3,99}, [8])
    assert [1] = IntcodeProgram.output({3,3,1107,-1,8,3,4,3,99}, [7])

    # outputs 0 if input == 0, 1 otherwise
    assert [1] = IntcodeProgram.output({3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9}, [8])
    assert [0] = IntcodeProgram.output({3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9}, [0])
    assert [1] = IntcodeProgram.output({3,3,1105,-1,9,1101,0,0,12,4,12,99,1}, [8])
    assert [0] = IntcodeProgram.output({3,3,1105,-1,9,1101,0,0,12,4,12,99,1}, [0])

    # outputs 999 if input < 8, 1000 if == 8 and 1001 if > 8
    assert [999] = IntcodeProgram.output({3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99}, [7])
    assert [1000] = IntcodeProgram.output({3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99}, [8])
    assert [1001] = IntcodeProgram.output({3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31, 1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104, 999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99}, [9])
  end
end
