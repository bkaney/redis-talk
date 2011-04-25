require 'ohm'

class Movie < Ohm::Model
  attribute   :title
  attribute   :genre

  set         :jets, Jet

  index       :genre  
end
