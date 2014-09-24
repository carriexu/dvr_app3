Sequel.migration do
  up do
    create_table(:dvrs_recordings) do
      primary_key :id
      foreign_key :dvr_id, :dvrs
      foreign_key :recording_id, :recordings
    end
  end

  down do
    drop_table(:dvrs_recordings)
  end
end
