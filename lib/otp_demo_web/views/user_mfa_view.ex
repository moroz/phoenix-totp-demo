defmodule OtpDemoWeb.UserMfaView do
  use OtpDemoWeb, :view

  def render_qr_code(content) do
    content
    |> EQRCode.encode()
    |> EQRCode.svg(width: 200)
  end
end
