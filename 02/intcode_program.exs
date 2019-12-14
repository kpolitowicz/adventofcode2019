defmodule IntcodeProgram do
  def read_from(string) do
    String.split(string, ",")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end
end
