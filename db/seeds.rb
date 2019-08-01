# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.clean_with(:truncation, :only => ['doctors', 'patients', 'appointments', "cities", "specialties"])

# Creation of 5 specialties
5.times do
  list_spe = ["cardiology", "dermatology", "general practitioner", "psychiatrist", "gastroenterologist"]
  for i in (0..4)
    Specialty.create(specialty: list_spe[i])
  end
end

# Creation of 10 cities
10.times do
  city = Faker::Address.city
  City.create(city: city)
end

# Creation of 10 doctors
for index in (1..10)
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  zip_code = rand(75001..75020).to_s
  city_id = rand(1..10)
  specialty_id = rand(1..5)
  doctor_id = rand(1..10)
  Doctor.create(first_name: first_name, last_name: last_name, zip_code: zip_code, city_id: city_id)
  JoinTableDoctorSpecialty.create(doctor_id: doctor_id, specialty_id: index)
end

# Creation of 50 patients
50.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  city_id = rand(1..10)
  Patient.create(first_name: first_name, last_name: last_name)
end

# Creation of 100 appointments
100.times do
  doctor_id = rand(1..10)
  patient_id = rand(1..50)
  city_id = rand(1..10)
  date = Faker::Date.forward(days: 30)
  Appointment.create(date: date, doctor_id: doctor_id, patient_id: patient_id)
end
