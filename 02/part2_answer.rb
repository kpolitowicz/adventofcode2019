require_relative 'intcode_program'

input_file = "#{__dir__}/input.txt"
program_code = File.read(input_file)
desired_output = 19690720

(0..99).each do |input1|
  (0..99).each do |input2|
    program = IntcodeProgram.new(program_code, [input1, input2])
    program.run

    if program.output == desired_output
      puts 100 * input1 + input2
      break
    end
  end
end
