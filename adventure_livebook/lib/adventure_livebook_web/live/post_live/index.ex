defmodule AdventureLivebookWeb.PostLive.Index do
  use AdventureLivebookWeb, :live_view

  alias AdventureLivebook.Blog
  alias AdventureLivebook.Blog.Post

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Blog.subscribe() # Will trigger handle_info functions
    {:ok, assign(socket, :posts, list_posts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    # TODO: change to stream assign.
    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, Blog.get_post!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, %Post{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Posts")
    |> assign(:post, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Blog.get_post!(id)
    {:ok, _} = Blog.delete_post(post)

    {:noreply, assign(socket, :posts, list_posts())}
  end

  @impl true
  def handle_info({:post_created, post}, socket) do
    # TODO: update to stream insert.
    {:noreply, update(socket, :posts, fn posts -> Enum.sort([post | posts]) end)}
  end

  @impl true
  def handle_info({:post_updated, post}, socket) do
    # callback = fn %{id: id} -> IO.inspect({"test string", id }) end
    # callback.(post)

    # %{id: id} = post;
    # {:noreply, update(socket, :posts, fn posts ->
    #   Enum.map(posts, fn
    #     %{id: ^id} -> post
    #     oldPost -> oldPost
    #   end)
    # end )}


    {:noreply, update(socket, :posts, fn posts ->
      Enum.map(posts, fn oldPost ->
        if post.id == oldPost.id, do: post, else: oldPost
      end)
    end )}
  end

  @impl true
  def handle_info({:post_deleted, post}, socket) do
    # %{id: id} = post
    # {:noreply, update(socket, :posts, fn posts -> Enum.filter(posts, fn %{id: ^id} -> false; _ -> true end) end)}

    {:noreply,
     update(socket, :posts, fn posts ->
       Enum.filter(posts, fn aPost -> aPost.id != post.id end)
     end)}
  end

  @impl true
  def handle_info(event, socket) do
    {:noreply, socket}
  end

  defp list_posts do
    Blog.list_posts() # TODO: should list be sorted?
  end
end
