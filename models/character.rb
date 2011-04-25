require 'ohm'

class Character < Ohm::Model
  attribute   :name
  reference   :movie, Movie
end
