Sequel.migration do
  up do
    create_table(:dvrs) do
      primary_key :id
      Integer :serial_number, :null => false
      Integer :hard_drive_size, :null => false
      String :zip_code, :size => 5, :null => false
    end
  end

  down do
    drop_table(:dvrs)
  end
end
