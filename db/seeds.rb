# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tutor.destroy_all

5.times do
    Tutor.create(name:Faker::Name.name)
end

puts "Tutors seeded"

#Student.destroy_all

#10.times do
    #Student.create(name:Faker::Name.name, grade: Faker::Number.within(range:30..100))
#end

#puts "Students seeded"

Course.destroy_all

students = Student.all

tutors = Tutor.all

20.times do
    Course.create(title:Faker::Educator.subject, content:Faker::Lorem.paragraph(sentence_count: 20), likes:0, student:students.sample, tutor:tutors.sample)
end

puts "Courses seeded"

puts "Seeding Complete"
