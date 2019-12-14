ExUnit.start

Code.require_file "intcode_input_finder.exs", __DIR__

defmodule IntcodeInputFinderTest do
  use ExUnit.Case

  test "encodes noun and verb" do
    assert 1202 = IntcodeInputFinder.encode_input(12, 2)
  end
end
