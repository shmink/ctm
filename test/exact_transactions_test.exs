defmodule TransactionsTest.ExactSearch do
  use ExUnit.Case
  alias Transactions.Merchants

  test "retrieval of name for a single transaction" do
    transaction = %Transactions{
      amount: "£20",
      description: "uber eats j5jgo help.uber.com",
      time: DateTime.utc_now()
    }

    namedTransaction = Merchants.findExactMerchantName(transaction)

    assert namedTransaction.name == "Uber Eats"
  end

  test "not able to retrieve name for single transaction" do
    transaction = %Transactions{
      amount: "£20",
      description: "legitimate payment",
      time: DateTime.utc_now()
    }

    namedTransaction = Merchants.findExactMerchantName(transaction)

    assert namedTransaction.name == "Unknown"
  end

  test "retrievel of names for multiple transactions" do
    transactions = [
      %Transactions{
        amount: "£7",
        description: "netflix.com 866-716-0414",
        time: DateTime.utc_now()
      },
      %Transactions{
        amount: "£20",
        description: "uber eats j5jgo help.uber.com",
        time: DateTime.utc_now()
      },
      %Transactions{
        amount: "£15",
        description: "sky subscription - sky subscription 38195672157 gb",
        time: DateTime.utc_now()
      }
    ]

    namedTransactions = Merchants.findExactMerchantName(transactions)

    assert Enum.all?(namedTransactions, fn t -> t.name != "Unkown" end)
  end
end
