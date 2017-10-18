defmodule SalesMgt.ItSale do
  use SalesMgt.Web, :model

  schema "sales" do
    field :date, Ecto.Date
    belongs_to :items, SalesMgt.Item, foreign_key: :item_id
    field :qty, :integer

    timestamps()
  end

  #@required_fields ~w(content item_id)
  #@optional_fields ~w()
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:date, :item_id, :qty])
    |> validate_required([:date, :item_id, :qty])
  end
end
