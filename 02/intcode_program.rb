class IntcodeProgram
  attr_reader :code, :inputs

  def initialize(code_str, inputs = nil)
    @inputs = inputs.dup
    @code = code_str.strip.split(',').map(&:to_i)
    @pointer = 0

    if inputs
      @code[1] = inputs.first
      @code[2] = inputs.last
    end
  end

  def run
    loop do
      result = run_next_command

      break if result == :halt
    end
  end

  def output
    code[0]
  end

  protected

    attr_accessor :pointer

  private

    def run_next_command
      case _opcode = code[pointer]
      when 1
        cmd_add
      when 2
        cmd_mult
      when 99
        :halt
      else
        puts "Command invalid"
        exit
      end
    end

    def cmd_add
      arg1_address = code[pointer + 1]
      arg2_address = code[pointer + 2]
      res_address  = code[pointer + 3]

      code[res_address] = code[arg1_address] + code[arg2_address]

      self.pointer += 4
      :ok
    end

    def cmd_mult
      arg1_address = code[pointer + 1]
      arg2_address = code[pointer + 2]
      res_address  = code[pointer + 3]

      code[res_address] = code[arg1_address] * code[arg2_address]

      self.pointer += 4
      :ok
    end
end
