defmodule SalesMgt.ItSaleTest do
  use SalesMgt.ModelCase

  alias SalesMgt.ItSale

  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, item_id: 42, qty: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ItSale.changeset(%ItSale{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ItSale.changeset(%ItSale{}, @invalid_attrs)
    refute changeset.valid?
  end
end
