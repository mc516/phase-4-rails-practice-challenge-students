class Student < ApplicationRecord
    validates :name, :major, :age, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 18 }

    belongs_to :instructor
end
