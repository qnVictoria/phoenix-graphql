defmodule GraphqlAuth.PostResolver do
  alias GraphqlAuth.Repo
  alias GraphqlAuth.Post

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end
end
