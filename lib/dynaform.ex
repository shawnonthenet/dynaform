defmodule Dynaform do
  @moduledoc """
  Documentation for Dynaform.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Dynaform.hello
      :world

  """
  def hello do
    :world
  end

  def link_to_add(link_text, changeset, template, target_id) do
    form = Phoenix.HTML.FormData.to_form(changeset, [])
    fields = render_to_string(__MODULE__, template, f: form)
    link link_text, to: "#", class: "dynaform-link-to-add", data: [target: target_id, template: fields]
  end
end
