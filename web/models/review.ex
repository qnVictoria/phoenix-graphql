defmodule GraphqlAuth.Review do
  use GraphqlAuth.Web, :model

  schema "reviews" do
    field :body, :string
    field :stars, :integer, default: 0
    belongs_to :user, GraphqlAuth.User, foreign_key: :user_id
    belongs_to :post, GraphqlAuth.Post, foreign_key: :post_id

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :user_id, :post_id, :stars])
    |> validate_required([:body, :user_id, :post_id])
    |> validate_inclusion(:stars, 0..5)
  end
end
