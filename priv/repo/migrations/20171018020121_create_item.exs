defmodule SalesMgt.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :price, :integer

      timestamps()
    end

  end
end
