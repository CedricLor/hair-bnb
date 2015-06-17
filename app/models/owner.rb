class Owner < User
  has_many :accomodations, dependent: :destroy
end
