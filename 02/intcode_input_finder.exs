defmodule IntcodeInputFinder do
  def find_inputs_for(output, program, arg1_range, arg2_range) do
    inputs_to_check = List.zip([Enum.to_list(arg1_range), Enum.to_list(arg2_range)])
  end

  def encode_input(noun, verb) do
    100 * noun + verb
  end
end
