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

  def findExactMerchantName(%Transactions{} = transaction) do
    merchant =
      Merchants
      |> Repo.get_by(description: transaction.description)

    case merchant do
      nil -> transaction
      _ -> Map.put(transaction, :name, merchant.name)
    end
  end

  def findExactMerchantName([%Transactions{} | _] = transactions) do
    transactions
    |> Enum.map(&findExactMerchantName/1)
  end

  def findClosestMerchantName(%Transactions{} = transaction) do
    search =
      transaction.description
      |> fuzzyFind()

    case search do
      [] -> transaction
      [closest | _] -> Map.put(transaction, :name, closest.name)
    end
  end

  def findClosestMerchantName([%Transactions{} | _] = transactions) do
    transactions
    |> Enum.map(&findClosestMerchantName/1)
  end

  # I added this in because I thought it would be cool to not rely on exact
  # string matching. Obviously, there's the chance for false positives.
  # But I believe threshold of 0.3 was a good balance for matching
  # similar descriptions based on the data set provided.
  defp fuzzyFind(term) do
    from(
      m in Merchants,
      where: fragment("SIMILARITY(?, ?) > 0.3", m.description, ^term),
      order_by: fragment("LEVENSHTEIN(?, ?)", m.description, ^term)
    )
    |> Repo.all()
  end
end
