defmodule CharlistWeb.Router do
  use CharlistWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {CharlistWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug ProperCase.Plug.SnakeCaseParams
  end

  pipeline :user_auth do
    plug Charlist.Accounts.Guardian.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
    plug CharlistWeb.CurrentUserPlug
  end

  scope "/", CharlistWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", CharlistWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  # if Mix.env() in [:dev, :test] do
  #   import Phoenix.LiveDashboard.Router

  #   scope "/" do
  #     pipe_through :browser

  #     live_dashboard "/dashboard", metrics: CharlistWeb.Telemetry
  #   end
  # end

  scope "/api/v1", CharlistWeb.V1 do
    pipe_through [:api]

    post "/users", UserController, :create

    pipe_through [:user_auth, :ensure_auth]

    resources "/charlists", CharlistController, only: [:index, :show, :create, :update]
    resources "/items", ItemController, only: [:index, :show]
  end
end
