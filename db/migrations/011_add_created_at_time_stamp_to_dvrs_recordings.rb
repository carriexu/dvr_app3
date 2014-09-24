Sequel.migration do
  change do
    alter_table(:dvrs_recordings) do
      add_column(:created_at, DateTime)
    end
  end
end
