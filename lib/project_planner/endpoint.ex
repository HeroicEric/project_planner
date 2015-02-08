defmodule ProjectPlanner.Endpoint do
  use Phoenix.Endpoint, otp_app: :project_planner

  plug Plug.Static,
    at: "/", from: :project_planner

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_project_planner_key",
    signing_salt: "t1b5j4du",
    encryption_salt: "5Gkqu4mX"

  plug :router, ProjectPlanner.Router
end
