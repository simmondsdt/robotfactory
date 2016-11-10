class Robot < ApplicationRecord
  has_many :parts
  belongs_to :inventor
  validates :name, :serial_number, presence: true
  validates :name, :serial_number, uniqueness: true
  validates :industry, inclusion: {
    in: %w(education war service novelty),
    message: "NOPE!"
  }, allow_nil: true
end
