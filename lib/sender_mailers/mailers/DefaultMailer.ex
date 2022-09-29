defmodule SenderMailers.Mailers.DefaultMailer do
  import Swoosh.Email

  def welcome(name, email) do
    new()
    |> to({name, email})
    |> from({"Dr B Banner", email})
    |> subject("Hello, Avengers (name)!")
    |> html_body("<h1>Hello #{name}</h1>")
    |> text_body("Hello #{name}\n")
  end
end
