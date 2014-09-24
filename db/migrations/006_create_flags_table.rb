Sequel.migration  do

  up do
    create_table(:flags) do
      primary_key :id
      String :name, :size => 127, :null => false
    end
  end

  down do
    drop_table(:flags)
  end

end
