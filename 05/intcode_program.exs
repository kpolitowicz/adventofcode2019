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
    instruction = elem(program, instruction_pointer)

    case execute_instruction(instruction, program, instruction_pointer) do
      {:ok, result} ->
        res_pos = elem(program, instruction_pointer + 3)
        program = put_elem(program, res_pos, result)
        execute_next_instruction(program, input, output, instruction_pointer + 4)

      :halt ->
        {program, output}
    end
  end

  defp execute_instruction(1 = _opcode, program, instruction_pointer) do
    arg1_pos = elem(program, instruction_pointer + 1)
    arg2_pos = elem(program, instruction_pointer + 2)

    {:ok, elem(program, arg1_pos) + elem(program, arg2_pos)}
  end
  defp execute_instruction(2 = _opcode, program, instruction_pointer) do
    arg1_pos = elem(program, instruction_pointer + 1)
    arg2_pos = elem(program, instruction_pointer + 2)

    {:ok, elem(program, arg1_pos) * elem(program, arg2_pos)}
  end
  defp execute_instruction(99 = _opcode, _program, _instruction_pointer), do: :halt
end
