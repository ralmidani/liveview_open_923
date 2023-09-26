defmodule MandatoryWeb.MapLive do
  use MandatoryWeb, :live_view
  alias Mandatory.MapCounter

  def render(assigns) do
    ~H"""
    <div>
      <.button phx-click="inc">
        Increment
      </.button>
      <p> <%= @counter %> </p>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    socket = socket
    |> assign(counter: "0")


    {:ok, socket}
  end

  def handle_event("inc", _params, socket) do
    updated = socket.assigns.counter
    |> MapCounter.new()
    |> MapCounter.add(5)





    {:noreply, assign(socket, counter: updated.counter)}
  end
end
