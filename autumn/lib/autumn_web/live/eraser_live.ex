defmodule AutumnWeb.EraserLive do
  use AutumnWeb, :live_view

  alias Autumn.TotalRecall

  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: to_form(%{}), eraser: nil)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= if @eraser do %>
        <%= TotalRecall.show(@eraser) %>
        <.button phx-click="next">Next</.button>

      <% else %>
        <.simple_form for={@form} phx-submit="submit">
          <.input field={@form[:text]} label="text"/>
          <.input field={@form[:steps]} label="steps"/>
          <:actions>
            <.button>Submit</.button>
          </:actions>
        </.simple_form>
      <% end %>
    </div>
    """
  end

  def handle_event("submit", unsigned_params, socket) do
    eraser = TotalRecall.new(unsigned_params["text"], String.to_integer(unsigned_params["steps"]))
    {:noreply, assign(socket, eraser: eraser)}
  end

  def handle_event("next", _unsigned_params, socket) do
    # Call Eraser reduce function
    eraser = TotalRecall.reduce(socket.assigns.eraser)
    {:noreply, assign(socket, eraser: eraser)}
  end
end
