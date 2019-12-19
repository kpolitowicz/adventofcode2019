Code.require_file "opcode.exs", __DIR__

defmodule IntcodeProgram do
  def read_from(string) do
    String.split(string, ",")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end

  def output(program, input) do
    {_new_program, output} = run(program, input)

    output
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

  defp execute_instruction(%Opcode{opcode: 1} = opcode, program, input, output, instruction_pointer) do
    arg1 = read_arg1(program, instruction_pointer, opcode)
    arg2 = read_arg2(program, instruction_pointer, opcode)

    res_pos = elem(program, instruction_pointer + 3)
    program = put_elem(program, res_pos, arg1 + arg2)

    {:ok, program, input, output, instruction_pointer + 4}
  end
  defp execute_instruction(%Opcode{opcode: 2} = opcode, program, input, output, instruction_pointer) do
    arg1 = read_arg1(program, instruction_pointer, opcode)
    arg2 = read_arg2(program, instruction_pointer, opcode)

    res_pos = elem(program, instruction_pointer + 3)
    program = put_elem(program, res_pos, arg1 * arg2)

    {:ok, program, input, output, instruction_pointer + 4}
  end
  defp execute_instruction(%Opcode{opcode: 3}, program, input, output, instruction_pointer) do
    res_pos = elem(program, instruction_pointer + 1)

    [value | input] = input
    program = put_elem(program, res_pos, value)

    {:ok, program, input, output, instruction_pointer + 2}
  end
  defp execute_instruction(%Opcode{opcode: 4} = opcode, program, input, output, instruction_pointer) do
    arg1 = read_arg1(program, instruction_pointer, opcode)
    output = [arg1 | output]

    {:ok, program, input, output, instruction_pointer + 2}
  end
  defp execute_instruction(%Opcode{opcode: 5} = opcode, program, input, output, instruction_pointer) do
    arg1 = read_arg1(program, instruction_pointer, opcode)
    arg2 = read_arg2(program, instruction_pointer, opcode)

    new_instruction_pointer =
      if arg1 != 0 do
        arg2
      else
        instruction_pointer + 3
      end

    {:ok, program, input, output, new_instruction_pointer}
  end
  defp execute_instruction(%Opcode{opcode: 6} = opcode, program, input, output, instruction_pointer) do
    arg1 = read_arg1(program, instruction_pointer, opcode)
    arg2 = read_arg2(program, instruction_pointer, opcode)

    new_instruction_pointer =
      if arg1 == 0 do
        arg2
      else
        instruction_pointer + 3
      end

    {:ok, program, input, output, new_instruction_pointer}
  end
  defp execute_instruction(%Opcode{opcode: 7} = opcode, program, input, output, instruction_pointer) do
    arg1 = read_arg1(program, instruction_pointer, opcode)
    arg2 = read_arg2(program, instruction_pointer, opcode)
    res = if arg1 < arg2, do: 1, else: 0

    res_pos = elem(program, instruction_pointer + 3)
    program = put_elem(program, res_pos, res)

    {:ok, program, input, output, instruction_pointer + 4}
  end
  defp execute_instruction(%Opcode{opcode: 8} = opcode, program, input, output, instruction_pointer) do
    arg1 = read_arg1(program, instruction_pointer, opcode)
    arg2 = read_arg2(program, instruction_pointer, opcode)
    res = if arg1 == arg2, do: 1, else: 0

    res_pos = elem(program, instruction_pointer + 3)
    program = put_elem(program, res_pos, res)

    {:ok, program, input, output, instruction_pointer + 4}
  end
  defp execute_instruction(%Opcode{opcode: 99}, _program, _input, _output, _instruction_pointer), do: :halt

  defp read_arg1(program, instruction_pointer, opcode) do
    if opcode.arg1_mode == 0 do
      arg_pos = elem(program, instruction_pointer + 1)
      elem(program, arg_pos)
    else
      elem(program, instruction_pointer + 1)
    end
  end

  defp read_arg2(program, instruction_pointer, opcode) do
    if opcode.arg2_mode == 0 do
      arg_pos = elem(program, instruction_pointer + 2)
      elem(program, arg_pos)
    else
      elem(program, instruction_pointer + 2)
    end
  end
end
