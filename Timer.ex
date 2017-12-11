defmodule Timer do
  def remind(note, time_in_seconds) do
    spawn(fn ->
      :timer.sleep(time_in_seconds * 1000)
      IO.puts note
    end)
  end
end

Timer.remind("Stand Up", 5)
Timer.remind("Sit Down", 10)
Timer.remind("Fight, Fight, Fight", 15)
