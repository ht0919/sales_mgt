defmodule SalesMgt.ItemTest do
  use SalesMgt.ModelCase

  alias SalesMgt.Item

  @valid_attrs %{name: "some content", price: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Item.changeset(%Item{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Item.changeset(%Item{}, @invalid_attrs)
    refute changeset.valid?
  end
end
