defmodule MiddlewareWeb.SourceDeviceController do
  use MiddlewareWeb, :controller

  alias Middleware.SourceDevices
  alias Middleware.SourceDevices.SourceDevice

  def index(conn, _params) do
    source_devices = SourceDevices.list_source_devices()
    render(conn, "index.html", source_devices: source_devices)
  end

  def new(conn, _params) do
    changeset = SourceDevices.change_source_device(%SourceDevice{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"source_device" => source_device_params}) do
    case SourceDevices.create_source_device(source_device_params) do
      {:ok, source_device} ->
        conn
        |> put_flash(:info, "Source device created successfully.")
        |> redirect(to: Routes.source_device_path(conn, :show, source_device))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    source_device = SourceDevices.get_source_device!(id)
    render(conn, "show.html", source_device: source_device)
  end

  def edit(conn, %{"id" => id}) do
    source_device = SourceDevices.get_source_device!(id)
    changeset = SourceDevices.change_source_device(source_device)
    render(conn, "edit.html", source_device: source_device, changeset: changeset)
  end

  def update(conn, %{"id" => id, "source_device" => source_device_params}) do
    source_device = SourceDevices.get_source_device!(id)

    case SourceDevices.update_source_device(source_device, source_device_params) do
      {:ok, source_device} ->
        conn
        |> put_flash(:info, "Source device updated successfully.")
        |> redirect(to: Routes.source_device_path(conn, :show, source_device))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", source_device: source_device, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    source_device = SourceDevices.get_source_device!(id)
    {:ok, _source_device} = SourceDevices.delete_source_device(source_device)

    conn
    |> put_flash(:info, "Source device deleted successfully.")
    |> redirect(to: Routes.source_device_path(conn, :index))
  end
end
