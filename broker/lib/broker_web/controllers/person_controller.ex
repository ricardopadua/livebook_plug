defmodule BrokerWeb.PersonController do
  use BrokerWeb, :controller

  alias Broker.Persons
  alias Broker.Persons.Person

  def index(conn, _params) do
    persons = Persons.list_persons()
    render(conn, :index, persons: persons)
  end

  def new(conn, _params) do
    changeset = Persons.change_person(%Person{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"person" => person_params}) do
    case Persons.create_person(person_params) do
      {:ok, person} ->
        conn
        |> put_flash(:info, "Person created successfully.")
        |> redirect(to: ~p"/persons/#{person}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Persons.get_person!(id)
    render(conn, :show, person: person)
  end

  def edit(conn, %{"id" => id}) do
    person = Persons.get_person!(id)
    changeset = Persons.change_person(person)
    render(conn, :edit, person: person, changeset: changeset)
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Persons.get_person!(id)

    case Persons.update_person(person, person_params) do
      {:ok, person} ->
        conn
        |> put_flash(:info, "Person updated successfully.")
        |> redirect(to: ~p"/persons/#{person}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, person: person, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Persons.get_person!(id)
    {:ok, _person} = Persons.delete_person(person)

    conn
    |> put_flash(:info, "Person deleted successfully.")
    |> redirect(to: ~p"/persons")
  end
end
