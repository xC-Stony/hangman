defmodule Super do
  use Supervisor

  def play do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(HighScore, []),
      worker(Game, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
