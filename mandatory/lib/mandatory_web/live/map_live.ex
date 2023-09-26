defmodule MandatoryWeb.MapLive do
  use MandatoryWeb, :live_view
  alias Mandatory.MapCounter

  def render(assigns) do
    ~H"""
    <div>
      <.counter count={@count}/>
    </div>
    """
  end

  attr :count, :any, required: true
  def counter(assigns) do
    ~H"""
      <.button phx-click="inc">
        Increment
      </.button>
      <p> <%= MapCounter.show(@count) %> </p>
    """
  end

  def mount(%{"count" => count}, _session, socket) do
    socket = socket
    |> assign(count: MapCounter.new(count))

    {:ok, socket}
  end

  def handle_event("inc", _params, %{assigns: %{count: counter}} = socket) do
    updated = MapCounter.add(counter, 5)

    {:noreply, assign(socket, count: updated)}
  end
end
