defmodule TransactionsTest.FuzzySearch do
  use ExUnit.Case
  alias Transactions.Merchants

  test "retrieval of name for a single transaction" do
    transaction = %Transactions{
      amount: "£20",
      description: "uber eats randomNumber help.uber.com",
      time: DateTime.utc_now()
    }

    namedTransaction = Merchants.findClosestMerchantName(transaction)

    assert namedTransaction.name == "Uber Eats"
  end

  test "not able to retrieve a name nothing close enough" do
    transaction = %Transactions{
      amount: "£20",
      description: ".com",
      time: DateTime.utc_now()
    }

    namedTransaction = Merchants.findClosestMerchantName(transaction)

    assert namedTransaction.name == "Unknown"
  end

  test "retrieving of names for multiple transactions" do
    transactions = [
      %Transactions{
        amount: "£7",
        description: "53839 netflix &R(£",
        time: DateTime.utc_now()
      },
      %Transactions{
        amount: "£7",
        description: "netflix.ca payment 12432",
        time: DateTime.utc_now()
      }
    ]

    namedTransactions = Merchants.findClosestMerchantName(transactions)

    assert Enum.map(namedTransactions, fn t -> t.name == "Netflix" end)
  end
end
