defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug Ueberauth

  def callback(%{assigns: %{ueberauth_auth: auth}}, params) do
  end
end
