defmodule SenderMailers.SenderMailers do
  def send do
    1..1_559_426
    |> Enum.chunk_every(100)
    |> Enum.map(fn items ->
      SenderMailers.Workers.Sender.new(%{ items: items })
      |> Oban.insert!
    end)
  end
end
