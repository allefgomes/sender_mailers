defmodule SenderMailers.SenderMailers do
  def send do
    Enum.to_list(1..1_000_000)
    |> Enum.each(fn n ->
      SenderMailers.Mailers.DefaultMailer.welcome("Person #{n}", "mail#{n}@mail.com")
      |> SenderMailers.Mailer.deliver
    end)
  end
end
