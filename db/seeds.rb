admin =
  Admin.new(
    first_name: 'Daniel',
    last_name: 'Hernandez',
    email: 'qsrtasks@gmail.com',
    phone: '2107718720',
    password: 'mina1973',
    password_confirmation: 'mina1973'
  )
admin.save

org =
  Organization.new(
    name: 'Stagg Restaurants',
    street: '8507 Speedway',
    state: 'TX',
    city: 'San Antonio',
    zip: '78230',
    phone: '2103757100'
  )
org.save

positions_list = {
  'DO' => {
    'name' => 'Director',
    'organization_id' => '1',
    'department' => 'Administration'
  },
  'OM' => {
    'name' => 'Operations Manager',
    'organization_id' => '1',
    'department' => 'Operations'
  },
  'AA' => {
    'name' => 'AA',
    'organization_id' => '1',
    'department' => 'Maintenance'
  },
  'Supervisor' => {
    'name' => 'Supervisor',
    'organization_id' => '1',
    'department' => 'Operations'
  },
  'General Manager' => {
    'name' => 'General Manager',
    'organization_id' => '1',
    'department' => 'Operations'
  },
  'AP Manager' => {
    'name' => 'AP Manager',
    'organization_id' => '1',
    'department' => 'Office'
  },
  'AR Manager' => {
    'name' => 'AR Manager',
    'organization_id' => '1',
    'department' => 'Office'
  },
  'Business Director' => {
    'name' => 'Business Director',
    'organization_id' => '1',
    'department' => 'Administration'
  },
  'HR Manager' => {
    'name' => 'HR Manager',
    'organization_id' => '1',
    'department' => 'Office'
  },
  'HR Office Admin' => {
    'name' => 'HR Office Admin',
    'organization_id' => '1',
    'department' => 'Office'
  },
  'Maint Admin' => {
    'name' => 'Maint Admin',
    'organization_id' => '1',
    'department' => 'Maintenance'
  },
  'Maint Department Head' => {
    'name' => 'Maint Department Head',
    'organization_id' => '1',
    'department' => 'Maintenance'
  },
  'Maint Tech' => {
    'name' => 'Maint Tech',
    'organization_id' => '1',
    'department' => 'Maintenance'
  },
  'Maint Tech Department Head' => {
    'name' => 'Maint Tech Department Head',
    'organization_id' => '1',
    'department' => 'Maintenance'
  },
  'Manager' => {
    'name' => 'Manager',
    'organization_id' => '1',
    'department' => 'Operations'
  },
  'Marketing Manager' => {
    'name' => 'Marketing Manager',
    'organization_id' => '1',
    'department' => 'Office'
  },
  'Office Admin' => {
    'name' => 'Office Admin',
    'organization_id' => '1',
    'department' => 'Office'
  },
  'OTP Tech' => {
    'name' => 'OTP Tech',
    'organization_id' => '1',
    'department' => 'Maintenance'
  },
  'Owner' => {
    'name' => 'Owner',
    'organization_id' => '1',
    'department' => 'Administration'
  },
  'Patch Maint' => {
    'name' => 'Patch Maint',
    'organization_id' => '1',
    'department' => 'Maintenance'
  },
  'Payroll Manager' => {
    'name' => 'Payroll Manager',
    'organization_id' => '1',
    'department' => 'Office'
  },
  'PM Department Head' => {
    'name' => 'PM Department Head',
    'organization_id' => '1',
    'department' => 'Maintenance'
  },
  'Shopper' => {
    'name' => 'Shopper',
    'organization_id' => '1',
    'department' => 'Office'
  },
  'Technology Department Head' => {
    'name' => 'Technology Department Head',
    'organization_id' => '1',
    'department' => 'Maintenance'
  },
  'Training Manager' => {
    'name' => 'Training Manager',
    'organization_id' => '1',
    'department' => 'Office'
  },
  'Crew' => {
    'name' => 'Crew',
    'organization_id' => '1',
    'department' => 'Operations'
  }
}

positions_list.each do |_name, position_hash|
  p = Position.create(position_hash)
  p.save
end

stores = []
first = []
second = []
third = []
fourth = []
fifth = []
sixth = []
seventh = []
eight = []
i = 1

Store.create(
name: "South Laredo",
number: 1480,
street: "8507 Speedway Drive",
city: "San Antonio",
state: "TX",
zip: "78230",
phone: "1-210-375-7100",
safe: "1500",
headset: "8",
store_type: "Traditional",
organization_id: 1,
active: true,
email: "hou.01480@us.stores.mcd.com"
)
Store.create(
  name: "SW Military",
  number: 1703,
  street: "8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email:" hou.01703@us.stores.mcd.com"
)
Store.create(
  name: "San Pedro",
  number: 1725,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.01725@us.stores.mcd.com"
)
Store.create(
  name: "West Commerce",
  number: 2962,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.02962@us.stores.mcd.com"
)
Store.create(
  name: "Southcross",
  number: 3348,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email:"hou.03348@us.stores.mcd.com"
)
Store.create(
  name: "I-10 Wurzbach",
  number: 3447,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.03447@us.stores.mcd.com"
)
Store.create(
  name: "WW White",
  number: 5166,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.05166@us.stores.mcd.com"
)
Store.create(
  name: "Roosevelt",
  number: 5623,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.05623@us.stores.mcd.com"
)
Store.create(
  name: "Walters Rd",
  number: 5984,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "dal.05984@us.stores.mcd.com"
)
Store.create(
  name: "Hill Country",
  number: 6661,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.06661@us.stores.mcd.com"
)
Store.create(
  name: "West Houston",
  number: 7091,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.07091@us.stores.mcd.com"
)
Store.create(
  name: "Med Center",
  number: 7850,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.07850@us.stores.mcd.com"
)
Store.create(
  name: "New Braunfels",
  number: 10271,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "dal.10271@us.stores.mcd.com"
)
Store.create(
  name: "Vance Jackson",
  number: 10586,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.10586@us.stores.mcd.com"
)
Store.create(
  name: "Guilbeau",
  number: 10675,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.10675@us.stores.mcd.com"
)
Store.create(
  name: "Schertz",
  number: 11966,
  street:"8507 Speedway Drive",
  city: "Schertz",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "2500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "dal.11966@us.stores.mcd.com"
)
Store.create(
  name: "DeZavala",
  number: 12673,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.12673@us.stores.mcd.com"
)
Store.create(
  name: "Zarzamora",
  number: 13364,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.13364@us.stores.mcd.com"
)
Store.create(
  name: "Broadway",
  number: 14073,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.14073@us.stores.mcd.com"
)
Store.create(
  name: "Rigsby",
  number: 17726,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.17726@us.stores.mcd.com"
)
Store.create(
  name: "Babcock & Prue",
  number: 19116,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.19116@us.stores.mcd.com"
)
Store.create(
  name: "Foster Rd",
  number: 19174,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "dal.19174@us.stores.mcd.com"
)
Store.create(
  name: "O'Conner",
  number: 22796,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.22796@us.stores.mcd.com"
)
Store.create(
  name: "Floresville",
  number: 23005,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.23005@us.stores.mcd.com"
)
Store.create(
  name: "Converse",
  number: 24388,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.24388@us.stores.mcd.com"
)
Store.create(
  name: "Stonecroft",
  number: 26150,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.26150@us.stores.mcd.com"
)
Store.create(
  name: "Ralph Fair",
  number: 28656,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.28656@us.stores.mcd.com"
)
Store.create(
  name: "Somerset",
  number: 32872,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.32872@us.stores.mcd.com"
)
Store.create(
  name: "The Rim",
  number: 34798,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.34798@us.stores.mcd.com"
)
Store.create(
  name: "Comfort",
  number: 35416,
  street:"8507 Speedway Drive",
  city: "Comfort",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "hou.35416@us.stores.mcd.com"
)
Store.create(
  name: "Palo Alto",
  number: 38841,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "dal.38841@us.stores.mcd.com"
)
Store.create(
  name: "Foster Rd & I-10",
  number: 39510,
  street:"8507 Speedway Drive",
  city: "San Antonio",
  state: "TX",
  zip: "78230",
  phone: "1-210-375-7100",
  safe: "1500",
  headset: "8",
  store_type: "Traditional",
  organization_id: 1,
  active: true,
  email: "dal.39510@us.stores.mcd.com"
)

User.create(
  first_name: 'daniel',
  last_name: 'hernandez ',
  email: 'dhernandez@staggrp.com',
  phone: '1-210-771-8720',
  password: 'mina1973',
  payroll_id: Faker::Alphanumeric.alphanumeric(number: 15, min_alpha: 3, min_numeric: 3),
  password_confirmation: 'mina1973',
  position_id: '1',
  admin: 'true',
  organization_id: '1',
  stores: Store.all
)

50.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    phone: '1-210-772-8720',
    payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
    password: 'mina1973',
    password_confirmation: 'mina1973',
    position_id:  Faker::Number.between(from: 2, to: 26),
    admin: 'false',
    organization_id: '1',
    stores: []
  )
end

  i = 1
  User.create(
    first_name: "Annette",
    last_name: "Sanderson",
    email: "asanderson@staggrp.com",
    payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
    phone: '1-210-305-0513',
    password: 'mina1973',
    password_confirmation: 'mina1973',
    position_id:  4,
    admin: 'false',
    organization_id: '1',
    stores: [
      Store.find(19), Store.find(20), Store.find(21), Store.find(22)
    ]
  )
  User.create(
    first_name: "Carol",
    last_name: "Puente",
    email: "cpuente@staggrp.com",
    payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
    phone: '1-210-823-0757',
    password: 'mina1973',
    password_confirmation: 'mina1973',
    position_id:  4,
    admin: 'false',
    organization_id: '1',
    stores: [
      Store.find(1), Store.find(2), Store.find(3), Store.find(4)
    ]
  )
  User.create(
    first_name: "Fred",
    last_name: "Casanova",
    email: "fcasanova@staggrp.com",
    payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
    phone: '1-210-602-2801',
    password: 'mina1973',
    password_confirmation: 'mina1973',
    position_id:  4,
    admin: 'false',
    organization_id: '1',
    stores: [
      Store.find(5), Store.find(6), Store.find(7)
    ]
  )
  User.create(
    first_name: "Jason",
    last_name: "McCoy",
    email: "jmccoy@staggrp.com",
    payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
    phone: '1-210-471-8748',
    password: 'mina1973',
    password_confirmation: 'mina1973',
    position_id:  4,
    admin: 'false',
    organization_id: '1',
    stores: [
      Store.find(8), Store.find(9), Store.find(10), Store.find(11)
    ]
  )
  User.create(
    first_name: "Jeff",
    last_name: "Malone",
    email: "jmalone@staggrp.com",
    payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
    phone: '1-830-214-5820',
    password: 'mina1973',
    password_confirmation: 'mina1973',
    position_id:  4,
    admin: 'false',
    organization_id: '1',
    stores: [
      Store.find(12), Store.find(13), Store.find(14)
    ]
  )
  User.create(
    first_name: "Letty",
    last_name: "Ortiz",
    email: "lortiz@staggrp.com",
    payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
    phone: '1-210-870-4903',
    password: 'mina1973',
    password_confirmation: 'mina1973',
    position_id:  4,
    admin: 'false',
    organization_id: '1',
    stores: [
      Store.find(15), Store.find(16), Store.find(17), Store.find(18)
    ]
  )
  User.create(
    first_name: "Letty",
    last_name: "Martinez",
    email: "lmartinez@staggrp.com",
    payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
    phone: '1-210-663-5504',
    password: 'mina1973',
    password_confirmation: 'mina1973',
    position_id:  4,
    admin: 'false',
    organization_id: '1',
    stores: [
      Store.find(23), Store.find(24), Store.find(25), Store.find(26), Store.find(27)
    ]
  )
  User.create(
    first_name: "Toni",
    last_name: "Brown",
    email: "tbrown@staggrp.com",
    payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
    phone: '1-830-703-6570',
    password: 'mina1973',
    password_confirmation: 'mina1973',
    position_id:  4,
    admin: 'false',
    organization_id: '1',
    stores: [
      Store.find(28), Store.find(29), Store.find(30), Store.find(31)
    ]
  )

Store.all.each do |store|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    phone: '1-210-772-8720',
    payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
    password: 'mina1973',
    password_confirmation: 'mina1973',
    position_id:  5,
    admin: 'false',
    organization_id: '1',
    stores: [store]
  )

  20.times do
    User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.safe_email,
      phone: '1-210-772-8720',
      password: 'mina1973',
      payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
      password_confirmation: 'mina1973',
      position_id:  26,
      admin: 'false',
      organization_id: '1',
      stores: [store]
    )
  end

    10.times do
      User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.safe_email,
        phone: '1-210-772-8720',
        payroll_id: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
        password: 'mina1973',
        password_confirmation: 'mina1973',
        position_id:  15,
        admin: 'false',
        organization_id: '1',
        stores: [store]
      )
  end
end