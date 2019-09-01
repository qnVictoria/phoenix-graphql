defmodule GraphqlAuth.Comment do
  use GraphqlAuth.Web, :model

  schema "comments" do
    field :body, :string
    belongs_to :user, GraphqlAuth.User, foreign_key: :user_id
    belongs_to :post, GraphqlAuth.Post, foreign_key: :post_id

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :user_id, :post_id])
    |> validate_required([:body, :user_id, :post_id])
  end
end
