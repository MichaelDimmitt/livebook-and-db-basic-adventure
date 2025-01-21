defmodule AdventureLivebook.Notifications do
  use GenServer
  alias AdventureLivebook.{AdventureLivebook.Blog.Post, Repo}
  # import Poison, only: [decode!: 1] # does poison need to be added to mix.exs?
  def start_link(channel) do
    GenServer.start_link(__MODULE__, channel)
  end

  # channel is passed in at the worker level in application.ex
  def init(channel) do
    # IO.inspect([channel])
    {:ok, pid} = Application.get_env(:adventure_livebook, AdventureLivebook.Repo)
      |> Postgrex.Notifications.start_link()
    ref = Postgrex.Notifications.listen!(pid, channel)
    # IO.inspect({pid, ref})
    {:ok, {pid}}
    # ref = Postgrex.Notifications.listen!(pid, channel)
    # data = "foo"
    # # data = Blog.Post |> Repo.all
    # IO.inspect(ref)
    # {:ok, {pid, ref, channel, data}}
  end

  def handle_info(a,b) do
    # IO.inspect({a,b})
    {:noreply, {a, b}}
  end

  # todos: what should todo and todos be changed to? post and posts? or blog.post and blog.posts?
  # @topic "todo:list" # what does @topic  actually do?
  # def handle_info({:notification, pid, ref, "todos_changes", payload}, {pid, ref, channel, data}) do
  #   %{
  #     "data" => raw,
  #     "id" => id,
  #     "table" => "todos",
  #     "type" => type
  #   } = decode!(payload)
  #   row = for {k, v} <- raw, into: %{}, do: {String.to_atom(k), v}
  #   updated_data = case type do
  #     "UPDATE" -> Enum.map(data, fn x -> if x.id === id do Map.merge(x, row) else x end end)
  #     "INSERT" -> data ++ [struct(Blog.Post, row)]
  #     "DELETE" -> Enum.filter(data,  &(&1.id !== id))
  #   end
  #   AdventureLivebookWeb.Endpoint.broadcast!(@topic, "todos", %{todos: updated_data})
  #   {:noreply, {pid, ref, channel, updated_data}}
  # end
end
