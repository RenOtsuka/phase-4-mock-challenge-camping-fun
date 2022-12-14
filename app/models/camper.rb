class Camper < ApplicationRecord
  has_many :signups
  has_many :activities, through: :signups
  validates :name, presence: true
  validates :age, inclusion: {in: 8..18}
end
