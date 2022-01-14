defmodule OtpDemoWeb.PageController do
  use OtpDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
