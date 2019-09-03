defmodule GraphqlAuth.ProjectResolver do
  alias GraphqlAuth.Repo
  alias GraphqlAuth.Project

  import Ecto.Query, only: [where: 2]

  def all(_args, %{context: %{current_user: %{id: id}}}) do
    projects =
      Project
      |> where(user_id: ^id)
      |> Repo.all

    {:ok, projects}
  end

  def all(_args, _info) do
    {:error, "Not Authorized"}
  end

  def create(args, _info) do
    %Project{}
    |> Project.changeset(args)
    |> Repo.insert
  end

  def edit(%{id: id, project: project_params}, _info) do
    Repo.get!(Project, id)
    |> Project.changeset(project_params)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    Repo.get!(Project, id)
    |> Repo.delete
  end
end
