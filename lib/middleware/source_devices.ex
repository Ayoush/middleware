defmodule Middleware.SourceDevices do
  @moduledoc """
  The SourceDevices context.
  """

  import Ecto.Query, warn: false
  alias Middleware.Repo

  alias Middleware.SourceDevices.SourceDevice

  @doc """
  Returns the list of source_devices.

  ## Examples

      iex> list_source_devices()
      [%SourceDevice{}, ...]

  """
  def list_source_devices do
    Repo.all(SourceDevice)
  end

  @doc """
  Gets a single source_device.

  Raises `Ecto.NoResultsError` if the Source device does not exist.

  ## Examples

      iex> get_source_device!(123)
      %SourceDevice{}

      iex> get_source_device!(456)
      ** (Ecto.NoResultsError)

  """
  def get_source_device!(id), do: Repo.get!(SourceDevice, id)

  @doc """
  Creates a source_device.

  ## Examples

      iex> create_source_device(%{field: value})
      {:ok, %SourceDevice{}}

      iex> create_source_device(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_source_device(attrs \\ %{}) do
    %SourceDevice{}
    |> SourceDevice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a source_device.

  ## Examples

      iex> update_source_device(source_device, %{field: new_value})
      {:ok, %SourceDevice{}}

      iex> update_source_device(source_device, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_source_device(%SourceDevice{} = source_device, attrs) do
    source_device
    |> SourceDevice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a source_device.

  ## Examples

      iex> delete_source_device(source_device)
      {:ok, %SourceDevice{}}

      iex> delete_source_device(source_device)
      {:error, %Ecto.Changeset{}}

  """
  def delete_source_device(%SourceDevice{} = source_device) do
    Repo.delete(source_device)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking source_device changes.

  ## Examples

      iex> change_source_device(source_device)
      %Ecto.Changeset{source: %SourceDevice{}}

  """
  def change_source_device(%SourceDevice{} = source_device) do
    SourceDevice.changeset(source_device, %{})
  end
end
