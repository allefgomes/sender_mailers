defmodule SenderMailers.Workers.Business do
  use Oban.Worker,
    queue: :mailers,
    tags: ["mailer"]

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"email" => email, "name" => name}}) do
    SenderMailers.Mailers.DefaultMailer.welcome(name, email)
    |> SenderMailers.Mailer.deliver

    :ok
  end
end
