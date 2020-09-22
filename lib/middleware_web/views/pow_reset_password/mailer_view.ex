defmodule MiddlewareWeb.PowResetPassword.MailerView do
  use MiddlewareWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
