defmodule OtpDemoWeb.LayoutView do
  use OtpDemoWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  # remember value at compile time
  @env Mix.env()
  def dev_env?, do: @env == :dev
end
