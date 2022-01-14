defmodule OtpDemoWeb.FormHelpers do
  use Phoenix.HTML
  import OtpDemoWeb.ErrorHelpers

  def input_field(form, name, opts) do
    label = Keyword.get(opts, :label)
    input_opts = opts |> Keyword.drop([:label]) |> Keyword.put(:class, "input")

    content_tag :div, class: "field" do
      [
        label(form, name, label, class: "label"),
        text_input(form, name, input_opts),
        error_tag(form, name)
      ]
    end
  end
end
