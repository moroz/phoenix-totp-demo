defmodule OtpDemoWeb.FormHelpers do
  use Phoenix.HTML
  import OtpDemoWeb.ErrorHelpers

  def input_field(form, name, opts \\ []) do
    label_text = Keyword.get(opts, :label)
    input_opts = opts |> Keyword.drop([:label]) |> Keyword.put(:class, "input")
    id = Keyword.get(opts, :id)
    label_opts = if id, do: [class: "label", for: id], else: [class: "label"]
    helper = Keyword.get(opts, :helper)

    content_tag :div, class: "field" do
      [
        label_with_default_content(form, name, label_text, label_opts),
        error_tag(form, name),
        text_input(form, name, input_opts),
        helper_tag(helper)
      ]
    end
  end

  defp label_with_default_content(form, name, nil, opts) do
    label(form, name, opts)
  end

  defp label_with_default_content(form, name, text, opts) do
    label(form, name, text, opts)
  end

  defp helper_tag(nil) do
    ""
  end

  defp helper_tag(text) do
    content_tag(:p, text, class: "help")
  end
end
