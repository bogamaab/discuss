defmodule Discuss.CommentsChannel do
  use Discuss.Web, :channel

  def join(name, _params, socket) do
    {:ok, %{hey: "there"} ,socket}
  end

  def handle_in(name, message, socket) do
    IO.puts(String.duplicate("xx", 100))
    IO.inspect(name)
    IO.puts(String.duplicate("xx", 100))
    IO.inspect(message)

    {:reply, :ok, socket}
  end
end
