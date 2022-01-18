defmodule OtpDemo.OtpHelpers do
  alias OtpDemo.Accounts.User

  def subject_for_otpauth(%User{} = user) do
    "OtpDemo:#{user.email}"
  end

  def otpauth_uri_for_user(%User{} = user) do
    secret = NimbleTOTP.secret()

    uri =
      user
      |> subject_for_otpauth()
      |> NimbleTOTP.otpauth_uri(secret, issuer: "OtpDemo")

    {secret, uri}
  end
end
