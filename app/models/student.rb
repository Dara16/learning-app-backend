class Student < ApplicationRecord
    has_many :courses, dependent: :destroy
    has_many :tutors, through: :courses
end
