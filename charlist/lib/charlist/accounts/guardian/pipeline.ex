defmodule Charlist.Accounts.Guardian.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :oz_api,
    error_handler: Charlist.Accounts.Guardian.ErrorHandler,
    module: Charlist.Accounts.Services.Guardian

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, allow_blank: true
end
