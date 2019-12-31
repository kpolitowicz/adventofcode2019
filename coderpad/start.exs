ExUnit.start

defmodule Example do
  def calculate(num) do
    div(num, 3) - 2
  end
end

defmodule ExampleTest do
  use ExUnit.Case

  test "calculates expression" do
    assert 2 = Example.calculate(12)
    assert 2 = Example.calculate(14)
    assert 654 = Example.calculate(1969)
    assert 33583 = Example.calculate(100756)
  end
end

