defmodule MiddlewareWeb.SourceDeviceControllerTest do
  use MiddlewareWeb.ConnCase

  alias Middleware.SourceDevices

  @create_attrs %{
    device_name: "some device_name",
    device_type: "some device_type",
    device_uuid: "some device_uuid"
  }
  @update_attrs %{
    device_name: "some updated device_name",
    device_type: "some updated device_type",
    device_uuid: "some updated device_uuid"
  }
  @invalid_attrs %{device_name: nil, device_type: nil, device_uuid: nil}

  def fixture(:source_device) do
    {:ok, source_device} = SourceDevices.create_source_device(@create_attrs)
    source_device
  end

  describe "index" do
    test "lists all source_devices", %{conn: conn} do
      conn = get(conn, Routes.source_device_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Source devices"
    end
  end

  describe "new source_device" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.source_device_path(conn, :new))
      assert html_response(conn, 200) =~ "New Source device"
    end
  end

  describe "create source_device" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.source_device_path(conn, :create), source_device: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.source_device_path(conn, :show, id)

      conn = get(conn, Routes.source_device_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Source device"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.source_device_path(conn, :create), source_device: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Source device"
    end
  end

  describe "edit source_device" do
    setup [:create_source_device]

    test "renders form for editing chosen source_device", %{
      conn: conn,
      source_device: source_device
    } do
      conn = get(conn, Routes.source_device_path(conn, :edit, source_device))
      assert html_response(conn, 200) =~ "Edit Source device"
    end
  end

  describe "update source_device" do
    setup [:create_source_device]

    test "redirects when data is valid", %{conn: conn, source_device: source_device} do
      conn =
        put(conn, Routes.source_device_path(conn, :update, source_device),
          source_device: @update_attrs
        )

      assert redirected_to(conn) == Routes.source_device_path(conn, :show, source_device)

      conn = get(conn, Routes.source_device_path(conn, :show, source_device))
      assert html_response(conn, 200) =~ "some updated device_name"
    end

    test "renders errors when data is invalid", %{conn: conn, source_device: source_device} do
      conn =
        put(conn, Routes.source_device_path(conn, :update, source_device),
          source_device: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Source device"
    end
  end

  describe "delete source_device" do
    setup [:create_source_device]

    test "deletes chosen source_device", %{conn: conn, source_device: source_device} do
      conn = delete(conn, Routes.source_device_path(conn, :delete, source_device))
      assert redirected_to(conn) == Routes.source_device_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.source_device_path(conn, :show, source_device))
      end
    end
  end

  defp create_source_device(_) do
    source_device = fixture(:source_device)
    {:ok, source_device: source_device}
  end
end
