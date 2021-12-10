class Student < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  validates :instructor_id, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :instructor
end
