defmodule Procp do


def proc1 do
  parent = self()
  spawn fn -> send(parent, {:hello, self()}) end

  receive do
      {:hello, pid} -> "got hello x from #{inspect pid}"
  end
end


end
