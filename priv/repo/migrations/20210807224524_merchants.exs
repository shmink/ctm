defmodule Merchants.Repo.Migrations.Merchants do
  use Ecto.Migration

  def change do
    create table(:merchants) do
      add(:description, :string)
      add(:name, :string)
    end
  end
end
