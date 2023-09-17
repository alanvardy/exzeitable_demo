defmodule ExzeitableDemo.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExzeitableDemo.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        age: 42
      })
      |> ExzeitableDemo.Accounts.create_user()

    user
  end
end
