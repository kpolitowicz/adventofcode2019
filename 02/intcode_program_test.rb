require 'minitest/autorun'

require_relative 'intcode_program'

class IntocodeProgramTest < Minitest::Test
  def test_initializes_with_code_and_inputs
    program = IntcodeProgram.new("1,9,10,3,2,3,11,0,99,30,40,50\n", [12, 2])

    assert_equal [1,12,2,3,2,3,11,0,99,30,40,50], program.code
  end

  def test_stops_proram_at_99_opcode
    program = IntcodeProgram.new("99")
    program.run

    assert_equal [99], program.code
  end

  def test_opcode_1_adds_arguments
    program = IntcodeProgram.new("1,0,0,0,99")
    program.run

    assert_equal [2,0,0,0,99], program.code
  end

  def test_opcode_1_adds_arguments_2
    program = IntcodeProgram.new("1,1,1,4,99,5,6,0,99")
    program.run

    assert_equal [30,1,1,4,2,5,6,0,99], program.code
  end

  def test_opcode_1_multiplies_arguments
    program = IntcodeProgram.new("2,3,0,3,99")
    program.run

    assert_equal [2,3,0,6,99], program.code
  end

  def test_opcode_1_multiplies_arguments_2
    program = IntcodeProgram.new("2,4,4,5,99,0")
    program.run

    assert_equal [2,4,4,5,99,9801], program.code
  end

  def test_runs_more_complex_program
    program = IntcodeProgram.new("1,9,10,3,2,3,11,0,99,30,40,50")
    program.run

    assert_equal [3500,9,10,70,2,3,11,0,99,30,40,50], program.code
    assert_equal 3500, program.output
  end
end
