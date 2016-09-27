parent = self()
spawn fn -> send(parent, {:hello, self()}) end

receive do
    {:hello, pid} -> "got hello from #{{inspect pid}}"
end
