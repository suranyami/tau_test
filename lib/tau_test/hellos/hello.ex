defmodule TauTest.Hellos.Hello do
  use Ecto.Schema
  import Ecto.Changeset


  schema "hello" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(hello, attrs) do
    hello
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
