# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Creation of 10 doctors
10.times do
  specialty = ["cardiology", "dermatology", "general practitioner", "psychiatrist", "gastroenterologist"]
  zip_code = rand(75001..75020).to_s
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Doctor.create(first_name: first_name, last_name: last_name, specialty: specialty.sample, zip_code: zip_code)
end

# Creation of 50 patients
50.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Patient.create(first_name: first_name, last_name: last_name)
end

# Creation of 100 appointments
100.times do
  doctor_id = rand(1..10)
  patient_id = rand(1..50)
  date = Faker::Date.forward(days: 30)
  Appointment.create(date: date, doctor_id: doctor_id, patient_id: patient_id)
end
