defmodule GraphqlAuth.Schema do
  use Absinthe.Schema
  import_types GraphqlAuth.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &GraphqlAuth.PostResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &GraphqlAuth.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &GraphqlAuth.UserResolver.find/2
    end
  end
end
