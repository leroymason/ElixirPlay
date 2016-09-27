defmodule Math do
  def sum(a,b) do
    a + b
  end

  def sum_list2([head | tail], accumulator) do
     sum_list2(tail, head + accumulator)
   end

   def sum_list2([], accumulator) do
     accumulator
   end

   def tesths2(x) do
      IO.puts x
   end

 end
