defmodule MandatoryWeb.MapLive do
  use MandatoryWeb, :live_view

  alias Mandatory.MapCounter
  alias MandatoryWeb.CounterComponent

  def render(assigns) do
    ~H"""
    <div>
      <.live_component module={CounterComponent} id="counter-1" count="0" />
      <.live_component module={CounterComponent} id="counter-2" count="0" />
    </div>
    """
  end

  def mount(%{"count" => count}, _session, socket) do
    socket = socket
    |> assign(count: MapCounter.new(count))

    {:ok, socket}
  end
end
