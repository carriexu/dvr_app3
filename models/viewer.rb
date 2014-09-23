# id   serial       PRIMARY KEY,
# name varchar(127) NOT NULL

class Viewer < Sequel::Model

  many_to_many(:series)

  # one_to_many(:recordings)

end
