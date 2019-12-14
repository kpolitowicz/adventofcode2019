defmodule Binaries do
  def printable?(binary) do
    Enum.all? binary, &(&1 >= ?\s && &1 <= ?´)
  end
end
