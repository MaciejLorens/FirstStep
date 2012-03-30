# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

=begin
  require 'rubygems'
  require 'roo'
  s = Excel.new("dane.xls")
  s.default_sheet = s.sheets.first
  puts s.cell(2,2)
  puts s.cell(2,3)
  puts s.cell(2,4)     cd
=end

User.destroy_all
User.create!(
    :email => "aa@aa.pl",
    :crypted_password => "12345678",
    :persistence_token => "12345678",
    :login_count => 0,
    :status => 1,
    :role_id => 1,
    :verifable_id => 1,
    :verifable_type => "type1" )

Employee.destroy_all
Employee.create!(
     :surname => "Jan",
     :name => "Kowalski",
     :employee_title_id => 1,
     :employee_group_id => 1,
     :employment_id => 1,
     :academy_unit_id => 1,
     :college_id => 1,
     :building_id => 1,
     :room => "12/a",
     :phone_number => "987 654 321",
     :academy_college_id => 1,
     :www => "http://www.aaa.pl",
     :comments => "comment1"
)

puts "seed data injected!"
