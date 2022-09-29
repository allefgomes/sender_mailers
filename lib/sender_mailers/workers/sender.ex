defmodule SenderMailers.Workers.Sender do
  use Oban.Worker,
    queue: :default,
    tags: ["default"]

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"items" => items}}) do
    Enum.map(items, fn n ->
      IO.puts "Sendind e-mail for mail#{n}@mail.com"

      SenderMailers.Workers.Business.new(%{name: "Person #{n}", email: "mail#{n}@mail.com"})
    end)
    |> Oban.insert_all

    :ok
  end
end
