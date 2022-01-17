defmodule OtpDemoWeb.UserMfaController do
  use OtpDemoWeb, :controller

  def new(conn, _params) do
    challenge = WebAuthnLite.Challenge.generate_base64_url_encoded_challenge()

    conn
    |> put_session(:webauthn_register_challenge, challenge)
    |> assign(:challenge, challenge)
    |> render("new.html")
  end
end
