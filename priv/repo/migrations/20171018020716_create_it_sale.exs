defmodule SalesMgt.Repo.Migrations.CreateItSale do
  use Ecto.Migration

  def change do
    create table(:sales) do
      add :date, :date
      add :item_id, :integer
      add :qty, :integer

      timestamps()
    end

  end
end
