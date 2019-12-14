defmodule IntcodeProgram do
  def read_from(string) do
    String.split(string, ",")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end

  def run(program) do
    execute_next_opcode(program, 0)
  end

  defp execute_next_opcode(program, current_position) do
    opcode = elem(program, current_position)

    case execute_opcode(opcode, program, current_position) do
      {:ok, result} ->
        res_pos = elem(program, current_position + 3)
        program = put_elem(program, res_pos, result)
        execute_next_opcode(program, current_position + 4)

      :halt ->
        program
    end
  end

  defp execute_opcode(1, program, current_position) do
    arg1_pos = elem(program, current_position + 1)
    arg2_pos = elem(program, current_position + 2)

    {:ok, elem(program, arg1_pos) + elem(program, arg2_pos)}
  end
  defp execute_opcode(2, program, current_position) do
    arg1_pos = elem(program, current_position + 1)
    arg2_pos = elem(program, current_position + 2)

    {:ok, elem(program, arg1_pos) * elem(program, arg2_pos)}
  end
  defp execute_opcode(99, _program, _current_position), do: :halt
end
