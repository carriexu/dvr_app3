puts "running create series_viewer table"
Sequel.migration do
  # if we an infer out the opposite action we can change

  # what we want to do
  up do
    create_table(:series_viewer) do
      primary_key :id
      foreign_key :viewer_id, :viewers
      foreign_key :series_id, :series
    end
  end

  # the undo
  down do
    drop_table(:series_viewer)
  end
end
