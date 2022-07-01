admin = Admin.new(first_name: 'Daniel', last_name: 'Hernandez', email: 'qsrtasks@gmail.com', phone: '2107718720', password: 'mina1973', password_confirmation: 'mina1973')
admin.save

org = Organization.new(name: 'Stagg Restaurants', street: '8507 Speedway', state: 'TX', city: 'San Antonio', zip: '78230', phone: '2103757100')
org.save

positions_list = {
  'DO' => { 'name' => 'Director', 'organization_id' => '1', 'department' => 'Administration' },
  'OM' => { 'name' => 'Operations Manager', 'organization_id' => '1', 'department' => 'Operations' },
  'AA' => { 'name' => 'AA', 'organization_id' => '1', 'department' => 'Maintenance' },
  'Supervisor' => { 'name' => 'Supervisor', 'organization_id' => '1', 'department' => 'Operations' },
  'General Manager' => { 'name' => 'General Manager', 'organization_id' => '1', 'department' => 'Operations' },
  'AP Manager' => { 'name' => 'AP Manager', 'organization_id' => '1', 'department' => 'Office' },
  'AR Manager' => { 'name' => 'AR Manager', 'organization_id' => '1', 'department' => 'Office' },
  'Business Director' => { 'name' => 'Business Director', 'organization_id' => '1', 'department' => 'Administration' },
  'HR Manager' => { 'name' => 'HR Manager', 'organization_id' => '1', 'department' => 'Office' },
  'HR Office Admin' => { 'name' => 'HR Office Admin', 'organization_id' => '1', 'department' => 'Office' },
  'Maint Admin' => { 'name' => 'Maint Admin', 'organization_id' => '1', 'department' => 'Maintenance' },
  'Maint Department Head' => { 'name' => 'Maint Department Head', 'organization_id' => '1', 'department' => 'Maintenance' },
  'Maint Tech' => { 'name' => 'Maint Tech', 'organization_id' => '1', 'department' => 'Maintenance' },
  'Maint Tech Department Head' => { 'name' => 'Maint Tech Department Head', 'organization_id' => '1', 'department' => 'Maintenance' },
  'Manager' => { 'name' => 'Manager', 'organization_id' => '1', 'department' => 'Operations' },
  'Marketing Manager' => { 'name' => 'Marketing Manager', 'organization_id' => '1', 'department' => 'Office' },
  'Office Admin' => { 'name' => 'Office Admin', 'organization_id' => '1', 'department' => 'Office' },
  'OTP Tech' => { 'name' => 'OTP Tech', 'organization_id' => '1', 'department' => 'Maintenance' },
  'Owner' => { 'name' => 'Owner', 'organization_id' => '1', 'department' => 'Administration' },
  'Patch Maint' => { 'name' => 'Patch Maint', 'organization_id' => '1', 'department' => 'Maintenance' },
  'Payroll Manager' => { 'name' => 'Payroll Manager', 'organization_id' => '1', 'department' => 'Office' },
  'PM Department Head' => { 'name' => 'PM Department Head', 'organization_id' => '1', 'department' => 'Maintenance' },
  'Shopper' => { 'name' => 'Shopper', 'organization_id' => '1', 'department' => 'Office' },
  'Technology Department Head' => { 'name' => 'Technology Department Head', 'organization_id' => '1', 'department' => 'Maintenance' },
  'Training Manager' => { 'name' => 'Training Manager', 'organization_id' => '1', 'department' => 'Office' },
  'Crew' => { 'name' => 'Crew', 'organization_id' => '1', 'department' => 'Operations' }
}

positions_list.each do |_name, position_hash|
  p = Position.create(position_hash)
  p.save
end

user = User.new(first_name: 'daniel', last_name: 'hernandez ', email: 'dhernandez@staggrp.com', phone: '2107718720', password: 'mina1973', password_confirmation: 'mina1973', position_id: '1', admin: 'true', organization_id: '1', rate: "11.00", payroll_id: "1234dh")
user.save