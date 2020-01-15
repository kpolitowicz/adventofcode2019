require_relative 'intcode_program'

input_file = "#{__dir__}/input.txt"
program_code = File.read(input_file)

program = IntcodeProgram.new(program_code, [12, 2])
program.run

puts program.output
