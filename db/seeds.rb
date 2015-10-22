# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 admin   = Group.create! name: 'admin', description: 'admin'
 owners  = Group.create! name: 'owners', description: 'owners'
 doctors = Group.create! name: 'doctors', description: 'doctors'
 staff   = Group.create! name: 'staff', description: 'staff'


kinds = %w(cat dog reptile bird)

kinds.each do |kind|
  Kind.create! name: kind
end

kind = Kind.find_by_name 'dog'

admin  = User.create! username: 'admin', email: 'admin@example.com', password: 'password', fname: 'admin', lname: 'admin', group_id: admin.id
doctor = User.create! username: 'doctor', email: 'adoc@example.com', password: 'password', fname: 'Ric doctor', lname: 'Grimms', group_id: doctors.id
owner  = User.create! username: 'owner', email: 'owner@example.com', password: 'password', fname: 'Carl owner', lname: 'Grimms', group_id: owners.id

pet  = Pet.create! name: 'Babby', age: 4, kind_id: kind.id, interned: false,  created: Time.now, user_id: owner.id
pet  = Pet.create! name: 'Totopo', age: 3, kind_id: kind.id, interned: false,  created: Time.now, user_id: owner.id

appo1 = {
  scheduled_time: 2.days.from_now.change(hour: 7),
  pet_id: pet.id,
  reminder:  true,
  active:  true,
  reason_for_visit: 'Vaccines',
  doctor_id: doctor.id,
  owner_id: owner.id
}

u1 = Appointment.create! appo1

appo2 = {
  scheduled_time: 10.days.from_now.change(hour: 7),
  pet_id: pet.id,
  reminder:  true,
  active:  true,
  reason_for_visit: 'Vaccines',
  doctor_id: doctor.id,
  owner_id: owner.id
}

u2 = Appointment.create! appo2
