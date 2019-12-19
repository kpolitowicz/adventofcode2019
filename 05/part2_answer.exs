Code.require_file "intcode_program.exs", __DIR__

{:ok, program_str} = File.read(__DIR__ <> "/input.txt")

{_program, output} =
  IntcodeProgram.read_from(program_str)
  |> IntcodeProgram.run([5])

IO.puts hd(output)
