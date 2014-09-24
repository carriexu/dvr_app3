Sequel.migration do
  up do
    create_table(:dvr_viewers) do
      primary_key :id
      foreign_key :dvr_id, :dvrs
      foreign_key :viewer_id, :viewers
    end
  end

  down do
    drop_table(:dvr_viewers)
  end
end
