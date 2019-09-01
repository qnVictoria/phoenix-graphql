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

  input_object :update_user_params do
    field :name, :string
    field :email, :string
    field :password, :string
  end

  input_object :update_post_params do
    field :title, non_null(:string)
    field :body, non_null(:string)
    field :user_id, non_null(:integer)
  end

  mutation do
    field :update_user, type: :user do
      arg :id, non_null(:integer)
      arg :user, :update_user_params

      resolve &GraphqlAuth.UserResolver.update/2
    end

    field :login, type: :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &GraphqlAuth.UserResolver.login/2
    end

    field :create_post, type: :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :user_id, non_null(:integer)

      resolve &GraphqlAuth.PostResolver.create/2
    end

    field :update_post, type: :post do
      arg :id, non_null(:integer)
      arg :post, :update_post_params

      resolve &GraphqlAuth.PostResolver.update/2
    end

    field :delete_post, type: :post do
      arg :id, non_null(:integer)

      resolve &GraphqlAuth.PostResolver.delete/2
    end

    field :create_comment, type: :comment do
      arg :body, non_null(:string)
      arg :post_id, non_null(:integer)

      resolve &GraphqlAuth.CommentResolver.create/2
    end

    field :delete_comment, type: :comment do
      arg :id, non_null(:integer)

      resolve &GraphqlAuth.CommentResolver.delete/2
    end
  end
end
