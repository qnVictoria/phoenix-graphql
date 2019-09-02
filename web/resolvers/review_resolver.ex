defmodule GraphqlAuth.ReviewResolver do
  alias GraphqlAuth.Repo
  alias GraphqlAuth.Review

  def create(args, %{context: %{current_user: %{id: user_id}}}) do
    args = Map.put(args, :user_id, user_id)

    %Review{}
    |> Review.changeset(args)
    |> Repo.insert
  end

  def update(%{id: id, review: review_params}, _info) do
    Repo.get!(Review, id)
    |> Review.changeset(review_params)
    |> Repo.update
  end

  def delete(%{id: id}, %{context: %{current_user: %{id: user_id}}}) do
    review = Repo.get!(Review, id)

    case review do
      %{user_id: ^user_id} -> Repo.delete(review)
      _ -> {:error, "It's not yours Review"}
    end
  end
end
