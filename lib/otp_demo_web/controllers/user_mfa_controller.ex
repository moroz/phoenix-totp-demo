defmodule OtpDemoWeb.UserMfaController do
  use OtpDemoWeb, :controller
  alias OtpDemo.Accounts
  alias OtpDemo.OtpHelpers

  def new(conn, _params) do
    user = conn.assigns.current_user
    {secret, uri} = OtpHelpers.otpauth_uri_for_user(user)

    conn
    |> put_session(:new_otp_secret, secret)
    |> assign(:uri, uri)
    |> render("new.html")
  end

  def create(conn, %{"pin_code" => code}) do
    user = conn.assigns.current_user
    otp_secret = get_session(conn, :new_otp_secret)

    if NimbleTOTP.valid?(otp_secret, code) do
      {:ok, _user} = Accounts.update_user_otp(user, %{totp_secret: otp_secret})

      conn
      |> delete_session(:new_otp_secret)
      |> redirect(to: Routes.page_path(conn, :index))
    else
      conn
      |> put_flash(:error, "The supplied OTP code is invalid. Please try again.")
      |> redirect(to: Routes.user_mfa_path(conn, :new))
    end
  end
end
