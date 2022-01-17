defmodule OtpDemoWeb.LayoutView do
  use OtpDemoWeb, :view

  # remember value at compile time
  @env Mix.env()
  def dev_env?, do: @env == :dev
end
