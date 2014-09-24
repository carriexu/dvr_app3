Sequel.migration do

  up do
    create_table(:flags_episodes) do
      primary_key :id
      foreign_key :episodes_id, :episodes
      foreign_key :series_id, :series
      # Integer :episodes_id, :null => false
      # Integer :series_id, :null => false
    end
  end

  down do
    drop_table(:flags_episodes)
  end
end
