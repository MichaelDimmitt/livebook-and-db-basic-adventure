defmodule AdventureLivebookWeb.PostLive.Show do
  use AdventureLivebookWeb, :live_view

  alias AdventureLivebook.Blog

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Blog.subscribe()
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post, Blog.get_post!(id))}
  end

  defp page_title(:show), do: "Show Post"
  defp page_title(:edit), do: "Edit Post"
end
