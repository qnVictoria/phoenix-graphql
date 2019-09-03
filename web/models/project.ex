defmodule GraphqlAuth.Project do
  use GraphqlAuth.Web, :model

  schema "projects" do
    field :title, :string
    field :body, :string
    belongs_to :user, GraphqlAuth.User, foreign_key: :user_id


    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
  end
end
