defmodule SalesMgt.Item do
  use SalesMgt.Web, :model

  schema "items" do
    field :name, :string
    field :price, :integer

    has_many :sales, SalesMgt.ItSale
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :price])
    |> validate_required([:name, :price])
  end
end
