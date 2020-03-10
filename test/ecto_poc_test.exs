defmodule EctoPocTest do
  use ExUnit.Case
  doctest EctoPoc

  test "greets the world" do
    assert EctoPoc.hello() == :world
  end
end
