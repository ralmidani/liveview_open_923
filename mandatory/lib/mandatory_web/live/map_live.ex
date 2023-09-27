defmodule MandatoryWeb.MapLive do
  use MandatoryWeb, :live_view

  alias Mandatory.MapCounter
  alias MandatoryWeb.CounterComponent

  def render(assigns) do
    ~H"""
    <div>
      <.live_component module={CounterComponent} id="counter-1" count={MapCounter.new("0")} />
      <.live_component module={CounterComponent} id="counter-2" count={MapCounter.new("1")} />
    </div>
    """
  end

  # constructor
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
