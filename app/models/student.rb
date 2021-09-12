class Student < ApplicationRecord
    has_many :courses
    has_many :tutors, through: :courses
end
