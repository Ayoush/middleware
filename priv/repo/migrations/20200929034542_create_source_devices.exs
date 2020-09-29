defmodule Middleware.Repo.Migrations.CreateSourceDevices do
  use Ecto.Migration

  def change do
    create table(:source_devices) do
      add :device_name, :string
      add :device_type, :string
      add :device_uuid, :string

      timestamps()
    end
  end
end
