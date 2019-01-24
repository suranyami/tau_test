defmodule TauTest.Hellos do
  @moduledoc """
  The Hellos context.
  """

  import Ecto.Query, warn: false
  alias TauTest.Repo

  alias TauTest.Hellos.Hello

  @doc """
  Returns the list of hello.

  ## Examples

      iex> list_hello()
      [%Hello{}, ...]

  """
  def list_hello do
    Repo.all(Hello)
  end

  @doc """
  Gets a single hello.

  Raises `Ecto.NoResultsError` if the Hello does not exist.

  ## Examples

      iex> get_hello!(123)
      %Hello{}

      iex> get_hello!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hello!(id), do: Repo.get!(Hello, id)

  @doc """
  Creates a hello.

  ## Examples

      iex> create_hello(%{field: value})
      {:ok, %Hello{}}

      iex> create_hello(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hello(attrs \\ %{}) do
    %Hello{}
    |> Hello.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hello.

  ## Examples

      iex> update_hello(hello, %{field: new_value})
      {:ok, %Hello{}}

      iex> update_hello(hello, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hello(%Hello{} = hello, attrs) do
    hello
    |> Hello.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Hello.

  ## Examples

      iex> delete_hello(hello)
      {:ok, %Hello{}}

      iex> delete_hello(hello)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hello(%Hello{} = hello) do
    Repo.delete(hello)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hello changes.

  ## Examples

      iex> change_hello(hello)
      %Ecto.Changeset{source: %Hello{}}

  """
  def change_hello(%Hello{} = hello) do
    Hello.changeset(hello, %{})
  end
end
