Code.require_file "opcode.exs", __DIR__

defmodule IntcodeProgram do
  def read_from(string) do
    String.split(string, ",")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end

  def run(program, input \\ []) do
    execute_next_instruction(program, input, [], 0)
  end

  defp execute_next_instruction(program, input, output, instruction_pointer) do
    instruction = Opcode.read(elem(program, instruction_pointer))

    case execute_instruction(instruction, program, input, output, instruction_pointer) do
      {:ok, program, input, output, instruction_pointer} ->
        execute_next_instruction(program, input, output, instruction_pointer)

      :halt ->
        {program, output}
    end
  end

  defp execute_instruction(%Opcode{opcode: 1}, program, input, output, instruction_pointer) do
    arg1_pos = elem(program, instruction_pointer + 1)
    arg2_pos = elem(program, instruction_pointer + 2)

    res_pos = elem(program, instruction_pointer + 3)
    program = put_elem(program, res_pos, elem(program, arg1_pos) + elem(program, arg2_pos))

    {:ok, program, input, output, instruction_pointer + 4}
  end
  defp execute_instruction(%Opcode{opcode: 2}, program, input, output, instruction_pointer) do
    arg1_pos = elem(program, instruction_pointer + 1)
    arg2_pos = elem(program, instruction_pointer + 2)

    res_pos = elem(program, instruction_pointer + 3)
    program = put_elem(program, res_pos, elem(program, arg1_pos) * elem(program, arg2_pos))

    {:ok, program, input, output, instruction_pointer + 4}
  end
  defp execute_instruction(%Opcode{opcode: 3}, program, input, output, instruction_pointer) do
    res_pos = elem(program, instruction_pointer + 1)

    [value | input] = input
    program = put_elem(program, res_pos, value)

    {:ok, program, input, output, instruction_pointer + 2}
  end
  defp execute_instruction(%Opcode{opcode: 4}, program, input, output, instruction_pointer) do
    arg_pos = elem(program, instruction_pointer + 1)
    output = [elem(program, arg_pos) | output]

    {:ok, program, input, output, instruction_pointer + 2}
  end
  defp execute_instruction(%Opcode{opcode: 99}, _program, _input, _output, _instruction_pointer), do: :halt
end
