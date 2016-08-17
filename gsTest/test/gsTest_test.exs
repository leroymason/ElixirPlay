defmodule GsTestTest do
  use ExUnit.Case
  doctest GsTest

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "fails" do
      assert 1+2 == 2
  end
end
