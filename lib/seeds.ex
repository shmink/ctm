defmodule Transactions.Seeds do
  alias Transactions.{Repo, Merchants}

  def add_default_merchants(merchants) do
    merchants |> Enum.map(&Repo.insert!(&1))
  end

  def default_merchants do
    [
      %Merchants{name: "Sainsburys", description: "sainsbury's sprmrkts lt london"},
      %Merchants{name: "Uber", description: "uber help.uber.com"},
      %Merchants{name: "Uber Eats", description: "uber eats j5jgo help.uber.com"},
      %Merchants{name: "Netflix", description: "netflix.com amsterdam"},
      %Merchants{name: "Amazon", description: "amazon eu sarl amazon.co.uk/"},
      %Merchants{name: "Netflix", description: "netflix.com 866-716-0414"},
      %Merchants{name: "Uber Eats", description: "uber eats 6p7n7 help.uber.com"},
      %Merchants{name: "Google", description: "google *google g.co/helppay#"},
      %Merchants{name: "Amazon Prime", description: "amazon prime amzn.co.uk/pm"},
      %Merchants{name: "DVLA", description: "dvla vehicle tax"},
      %Merchants{name: "DVLA", description: "dvla vehicle tax - vis"},
      %Merchants{name: "DVLA", description: "direct debit payment to dvla-i2den"},
      %Merchants{name: "DVLA", description: "dvla-ln99abc"},
      %Merchants{name: "Sky Digital", description: "sky digital 13524686324522"},
      %Merchants{name: "Sky Digital", description: "direct debit sky digital 83741234567852 ddr"},
      %Merchants{name: "Sky", description: "sky subscription - sky subscription 38195672157 gb"}
    ]
  end
end
