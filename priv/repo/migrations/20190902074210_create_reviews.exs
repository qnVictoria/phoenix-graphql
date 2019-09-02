defmodule GraphqlAuth.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :body, :string
      add :stars, :integer, default: 0, null: false
      add :user_id, references(:users, on_delete: :nothing)
      add :post_id, references(:posts, on_delete: :delete_all)

      timestamps()
    end

    create index(:reviews, [:post_id])
    create index(:reviews, [:user_id])
  end
end
