defmodule GraphqlAuth.User do
  use GraphqlAuth.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    has_many :posts, GraphqlAuth.Post

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email])
  end
end
