defmodule Hello2Test do
  use ExUnit.Case
  doctest Hello2

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "failure" do
    assert 1 + 1 = 3
  end
end
