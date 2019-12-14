defmodule IntcodeProgram do
  def read_from(string) do
    String.split(string, ",")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end

  def run(program) do
    execute_next_instruction(program, 0)
  end

  defp execute_next_instruction(program, current_position) do
    instruction = elem(program, current_position)

    case execute_instruction(instruction, program, current_position) do
      {:ok, result} ->
        res_pos = elem(program, current_position + 3)
        program = put_elem(program, res_pos, result)
        execute_next_instruction(program, current_position + 4)

      :halt ->
        program
    end
  end

  defp execute_instruction(1, program, current_position) do
    arg1_pos = elem(program, current_position + 1)
    arg2_pos = elem(program, current_position + 2)

    {:ok, elem(program, arg1_pos) + elem(program, arg2_pos)}
  end
  defp execute_instruction(2, program, current_position) do
    arg1_pos = elem(program, current_position + 1)
    arg2_pos = elem(program, current_position + 2)

    {:ok, elem(program, arg1_pos) * elem(program, arg2_pos)}
  end
  defp execute_instruction(99, _program, _current_position), do: :halt
end
