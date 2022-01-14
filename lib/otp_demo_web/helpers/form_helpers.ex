defmodule OtpDemoWeb.FormHelpers do
  use Phoenix.HTML
  import OtpDemoWeb.ErrorHelpers

  def input_field(form, name, opts) do
    label_text = Keyword.get(opts, :label)
    input_opts = opts |> Keyword.drop([:label]) |> Keyword.put(:class, "input")
    id = Keyword.get(opts, :id)
    label_opts = if id, do: [class: "label", for: id], else: [class: "label"]

    content_tag :div, class: "field" do
      [
        label_with_default_content(form, name, label_text, label_opts),
        error_tag(form, name),
        text_input(form, name, input_opts)
      ]
    end
  end

  defp label_with_default_content(form, name, nil, opts) do
    label(form, name, opts)
  end

  defp label_with_default_content(form, name, text, opts) do
    label(form, name, text, opts)
  end
end
