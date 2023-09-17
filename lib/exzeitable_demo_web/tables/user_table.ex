defmodule ExzeitableDemoWeb.UserTable do
  @moduledoc "User table"
  alias ExzeitableDemoWeb.Router.Helpers, as: Routes
  alias ExzeitableDemo.Accounts.User

  use Exzeitable,
    repo: ExzeitableDemo.Repo,
    routes: Routes,
    path: :user_path,
    fields: [name: [], age: [label: "Years old", search: false], name_backwards: [virtual: true]],
    query: from(u in User),
    per_page: 5

  def render(assigns), do: ~H"<%= build_table(assigns) %>"

  def name_backwards(_socket, entry) do
    entry
    |> Map.get(:name)
    |> String.reverse()
  end
end
