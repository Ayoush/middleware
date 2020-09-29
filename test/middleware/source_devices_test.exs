defmodule Middleware.SourceDevicesTest do
  use Middleware.DataCase

  alias Middleware.SourceDevices

  describe "source_devices" do
    alias Middleware.SourceDevices.SourceDevice

    @valid_attrs %{
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

    def source_device_fixture(attrs \\ %{}) do
      {:ok, source_device} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SourceDevices.create_source_device()

      source_device
    end

    test "list_source_devices/0 returns all source_devices" do
      source_device = source_device_fixture()
      assert SourceDevices.list_source_devices() == [source_device]
    end

    test "get_source_device!/1 returns the source_device with given id" do
      source_device = source_device_fixture()
      assert SourceDevices.get_source_device!(source_device.id) == source_device
    end

    test "create_source_device/1 with valid data creates a source_device" do
      assert {:ok, %SourceDevice{} = source_device} =
               SourceDevices.create_source_device(@valid_attrs)

      assert source_device.device_name == "some device_name"
      assert source_device.device_type == "some device_type"
      assert source_device.device_uuid == "some device_uuid"
    end

    test "create_source_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SourceDevices.create_source_device(@invalid_attrs)
    end

    test "update_source_device/2 with valid data updates the source_device" do
      source_device = source_device_fixture()

      assert {:ok, %SourceDevice{} = source_device} =
               SourceDevices.update_source_device(source_device, @update_attrs)

      assert source_device.device_name == "some updated device_name"
      assert source_device.device_type == "some updated device_type"
      assert source_device.device_uuid == "some updated device_uuid"
    end

    test "update_source_device/2 with invalid data returns error changeset" do
      source_device = source_device_fixture()

      assert {:error, %Ecto.Changeset{}} =
               SourceDevices.update_source_device(source_device, @invalid_attrs)

      assert source_device == SourceDevices.get_source_device!(source_device.id)
    end

    test "delete_source_device/1 deletes the source_device" do
      source_device = source_device_fixture()
      assert {:ok, %SourceDevice{}} = SourceDevices.delete_source_device(source_device)

      assert_raise Ecto.NoResultsError, fn ->
        SourceDevices.get_source_device!(source_device.id)
      end
    end

    test "change_source_device/1 returns a source_device changeset" do
      source_device = source_device_fixture()
      assert %Ecto.Changeset{} = SourceDevices.change_source_device(source_device)
    end
  end
end
