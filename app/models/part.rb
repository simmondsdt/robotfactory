class Part < ApplicationRecord
  belongs_to :robot
  validates :name, :number, presence: true
  validates :name, :number, uniqueness: true
end
