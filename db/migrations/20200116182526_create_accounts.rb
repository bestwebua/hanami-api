Hanami::Model.migration do
  change do
    create_table :accounts do
      primary_key :id

      column :email, String, unique: true
      column :password_digest, String
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
