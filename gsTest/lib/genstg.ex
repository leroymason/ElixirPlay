alias Experimental.GenStage

defmodule A do
  use GenStage

  def init(counter) do
    {:producer, counter}
  end

  def handle_demand(demand, counter) when demand > 0 do
    # If the counter is 3 and we ask for 2 items, we will
    # emit the items 3 and 4, and set the state to 5.
    events = Enum.to_list(counter..counter+demand-1)

    # The events to emit is the second element of the tuple,
    # the third being the state.
    {:noreply, events, counter + demand}
  end
end
# comment
defmodule B do
  use GenStage

  def init(number) do
    {:producer_consumer, number}
  end

  def handle_events(events, _from, number) do
    events = Enum.map(events, & &1 * number)
    {:noreply, events, number}
  end
end

defmodule C do
  use GenStage

  def init(sleeping_time) do
    {:consumer, sleeping_time}
  end

  def handle_events(events, _from, sleeping_time) do
    # Print events to terminal.
    IO.inspect(events)

    # Sleep the configured time.
    Process.sleep(sleeping_time)

    # We are a consumer, so we never emit events.
    {:noreply, [], sleeping_time}
  end
end
