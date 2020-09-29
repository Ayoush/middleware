defmodule Middleware.SourceDevices.SourceDevice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "source_devices" do
    field :device_name, :string
    field :device_type, :string
    field :device_uuid, :string

    timestamps()
  end

  @doc false
  def changeset(source_device, attrs) do
    source_device
    |> cast(attrs, [:device_name, :device_type, :device_uuid])
    |> validate_required([:device_name, :device_type, :device_uuid])
  end
end
