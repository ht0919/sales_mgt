defmodule SalesMgt.ItSaleControllerTest do
  use SalesMgt.ConnCase

  alias SalesMgt.ItSale
  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, item_id: 42, qty: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, it_sale_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing sales"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, it_sale_path(conn, :new)
    assert html_response(conn, 200) =~ "New it sale"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, it_sale_path(conn, :create), it_sale: @valid_attrs
    assert redirected_to(conn) == it_sale_path(conn, :index)
    assert Repo.get_by(ItSale, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, it_sale_path(conn, :create), it_sale: @invalid_attrs
    assert html_response(conn, 200) =~ "New it sale"
  end

  test "shows chosen resource", %{conn: conn} do
    it_sale = Repo.insert! %ItSale{}
    conn = get conn, it_sale_path(conn, :show, it_sale)
    assert html_response(conn, 200) =~ "Show it sale"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, it_sale_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    it_sale = Repo.insert! %ItSale{}
    conn = get conn, it_sale_path(conn, :edit, it_sale)
    assert html_response(conn, 200) =~ "Edit it sale"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    it_sale = Repo.insert! %ItSale{}
    conn = put conn, it_sale_path(conn, :update, it_sale), it_sale: @valid_attrs
    assert redirected_to(conn) == it_sale_path(conn, :show, it_sale)
    assert Repo.get_by(ItSale, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    it_sale = Repo.insert! %ItSale{}
    conn = put conn, it_sale_path(conn, :update, it_sale), it_sale: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit it sale"
  end

  test "deletes chosen resource", %{conn: conn} do
    it_sale = Repo.insert! %ItSale{}
    conn = delete conn, it_sale_path(conn, :delete, it_sale)
    assert redirected_to(conn) == it_sale_path(conn, :index)
    refute Repo.get(ItSale, it_sale.id)
  end
end
