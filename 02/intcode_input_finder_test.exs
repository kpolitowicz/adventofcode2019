ExUnit.start

Code.require_file "intcode_input_finder.exs", __DIR__

defmodule IntcodeInputFinderTest do
  use ExUnit.Case

  test "finds the program inputs that give desired output" do
    assert {0,0} = IntcodeInputFinder.find_inputs_for(1, {1,0,0,0,99}, 0..1, 2..3)
  end

  test "encodes noun and verb" do
    assert 1202 = IntcodeInputFinder.encode_input(12, 2)
  end
end
