Code.require_file "intcode_program.exs", __DIR__

{:ok, program_str} = File.read(__DIR__ <> "/input.txt")

program =
  IntcodeProgram.read_from(program_str)
  |> put_elem(1, 12)
  |> put_elem(2, 2)
  |> IntcodeProgram.run

IO.puts elem(program, 0)
