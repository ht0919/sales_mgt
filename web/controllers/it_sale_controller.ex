defmodule SalesMgt.ItSaleController do
  use SalesMgt.Web, :controller

  alias SalesMgt.ItSale

  def index(conn, _params) do
    #sales = Repo.all(ItSale)
    sales = Repo.all(ItSale) |> Repo.preload [:items]
    render(conn, "index.html", sales: sales)
  end

  def new(conn, _params) do
    changeset = ItSale.changeset(%ItSale{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"it_sale" => it_sale_params}) do
    changeset = ItSale.changeset(%ItSale{}, it_sale_params)

    case Repo.insert(changeset) do
      {:ok, _it_sale} ->
        conn
        |> put_flash(:info, "It sale created successfully.")
        |> redirect(to: it_sale_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    #it_sale = Repo.get!(ItSale, id)
    it_sale = Repo.get!(ItSale, id) |> Repo.preload [:items]
    render(conn, "show.html", it_sale: it_sale)
  end

  def edit(conn, %{"id" => id}) do
    it_sale = Repo.get!(ItSale, id)
    changeset = ItSale.changeset(it_sale)
    render(conn, "edit.html", it_sale: it_sale, changeset: changeset)
  end

  def update(conn, %{"id" => id, "it_sale" => it_sale_params}) do
    it_sale = Repo.get!(ItSale, id)
    changeset = ItSale.changeset(it_sale, it_sale_params)

    case Repo.update(changeset) do
      {:ok, it_sale} ->
        conn
        |> put_flash(:info, "It sale updated successfully.")
        |> redirect(to: it_sale_path(conn, :show, it_sale))
      {:error, changeset} ->
        render(conn, "edit.html", it_sale: it_sale, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    it_sale = Repo.get!(ItSale, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(it_sale)

    conn
    |> put_flash(:info, "It sale deleted successfully.")
    |> redirect(to: it_sale_path(conn, :index))
  end
end
