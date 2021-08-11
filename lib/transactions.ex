defmodule Transactions do
  use Ecto.Schema

  schema "transaction" do
    field(:amount, :string)
    field(:time, :utc_datetime)
    field(:description, :string)
    field(:name, :string, default: "Unknown")
  end
end
