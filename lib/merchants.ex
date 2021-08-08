defmodule Transactions.Merchants do
  use Ecto.Schema
  import Ecto.{Changeset, Query}

  alias __MODULE__
  alias Transactions.Repo

  schema "merchants" do
    field(:description, :string)
    field(:name, :string)
  end

  @valid_attributes [
    :description,
    :name
  ]

  def changeset(%Merchants{} = merchant, params \\ %{}) do
    merchant
    |> cast(params, @valid_attributes)
  end

  def get(id: id), do: get(%{id: id})
  def get(%{id: id}), do: Repo.get(Merchants, id)
end
