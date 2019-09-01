defmodule GraphqlAuth.CommentResolver do
  alias GraphqlAuth.Repo
  alias GraphqlAuth.Comment

  def create(args, %{context: %{current_user: %{id: user_id}}}) do
    args = Map.put(args, :user_id, user_id)

    %Comment{}
    |> Comment.changeset(args)
    |> Repo.insert
  end

  def delete(%{id: id}, %{context: %{current_user: %{id: user_id}}}) do
    comment = Repo.get!(Comment, id)

    case comment do
      %{user_id: ^user_id} -> Repo.delete(comment)
      _ -> {:error, "It's not yours Comment"}
    end
  end
end
