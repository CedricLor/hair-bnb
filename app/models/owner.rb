class Owner < User
  has_many :accomodations, counter_cache: true
end
