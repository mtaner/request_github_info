defmodule RequestGithubInfo.PageController do
  use RequestGithubInfo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
