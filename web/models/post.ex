defmodule GraphqlAuth.Post do
  use GraphqlAuth.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, GraphqlAuth.User, foreign_key: :user_id
    has_many :comments, GraphqlAuth.Comment

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
  end
end
