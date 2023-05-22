defmodule BrokerWeb.PersonControllerTest do
  use BrokerWeb.ConnCase

  import Broker.PersonsFixtures

  @create_attrs %{description: "some description", name: "some name"}
  @update_attrs %{description: "some updated description", name: "some updated name"}
  @invalid_attrs %{description: nil, name: nil}

  describe "index" do
    test "lists all persons", %{conn: conn} do
      conn = get(conn, ~p"/persons")
      assert html_response(conn, 200) =~ "Listing Persons"
    end
  end

  describe "new person" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/persons/new")
      assert html_response(conn, 200) =~ "New Person"
    end
  end

  describe "create person" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/persons", person: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/persons/#{id}"

      conn = get(conn, ~p"/persons/#{id}")
      assert html_response(conn, 200) =~ "Person #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/persons", person: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Person"
    end
  end

  describe "edit person" do
    setup [:create_person]

    test "renders form for editing chosen person", %{conn: conn, person: person} do
      conn = get(conn, ~p"/persons/#{person}/edit")
      assert html_response(conn, 200) =~ "Edit Person"
    end
  end

  describe "update person" do
    setup [:create_person]

    test "redirects when data is valid", %{conn: conn, person: person} do
      conn = put(conn, ~p"/persons/#{person}", person: @update_attrs)
      assert redirected_to(conn) == ~p"/persons/#{person}"

      conn = get(conn, ~p"/persons/#{person}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, person: person} do
      conn = put(conn, ~p"/persons/#{person}", person: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Person"
    end
  end

  describe "delete person" do
    setup [:create_person]

    test "deletes chosen person", %{conn: conn, person: person} do
      conn = delete(conn, ~p"/persons/#{person}")
      assert redirected_to(conn) == ~p"/persons"

      assert_error_sent 404, fn ->
        get(conn, ~p"/persons/#{person}")
      end
    end
  end

  defp create_person(_) do
    person = person_fixture()
    %{person: person}
  end
end
