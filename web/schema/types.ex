defmodule GraphqlAuth.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: GraphqlAuth.Repo

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :posts, list_of(:post), resolve: assoc(:posts)
  end

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :user, :user, resolve: assoc(:user)
    field :comments, list_of(:comment), resolve: assoc(:comments)
    field :reviews, list_of(:review), resolve: assoc(:reviews)

  end

  object :session do
    field :token, :string
  end

  object :comment do
    field :id, :id
    field :body, :string
  end

  object :review do
    field :id, :id
    field :body, :string
    field :stars, :integer
  end
end
