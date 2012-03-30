# script insert new person to 'employee' and 'user' table in database
# script can import data from xls, xlsx, ods, csv formats
# column order in data file: 'first_name' | 'last_name' | 'email' witch begins from the (1,A) cell
# path to data file is putted by user after 'rake db:seeds:import_persons' command

require 'rubygems'
require 'roo'

def create_user_and_employee(first_name, last_name, email)
  new_employee = Employee.create!(
      :surname => first_name,
      :name => last_name,
      :employee_title_id => 0,
      :employee_group_id => 0,
      :employment_id => 0,
      :academy_unit_id => 0,
      :college_id => 0,
      :building_id => 0,
      :room => "",
      :phone_number => "",
      :academy_college_id => 0,
      :www => "",
      :comments => "")

  User.create!(
      :email => email,
      :crypted_password => "12345678",
      :persistence_token => "12345678",
      :login_count => 0,
      :status => 0,
      :role_id => 0,
      :verifable_id => new_employee.id,
      :verifable_type => "Employee")
end

def is_nil_or_empty(str_to_check)
  str_to_check == nil || str_to_check.empty?
end

def write_data_from_file(file)
	file.default_sheet = file.sheets.first
	1.upto(file.last_row) do |line|
		first_name = file.cell(line,1)
		last_name = file.cell(line,2)
		email = file.cell(line,3)
		if is_nil_or_empty(first_name) || is_nil_or_empty(last_name) || is_nil_or_empty(email)
      puts "Something gone wrong! Check the #{line} line of file"
			next
    end
    create_user_and_employee(first_name, last_name, email)
		puts "#{first_name} #{last_name} (#{email}) \t putted into DB"
	end
end

def write_data_from_csv(file)
		IO.foreach(file){|line|
			first_name, last_name, email = line.chomp.split(",")
			if first_name.empty? || last_name.empty? || email.empty?
        puts "Something gone wrong! Check the #{line} line of file"
				next
			end
		  create_user_and_employee(first_name, last_name, email)
		  puts "#{first_name} #{last_name} (#{email}) \t putted into DB"
		}
end

def insert_data_from_file_to_db(file_name)
  extension = File.extname(file_name)
	case extension
		when ".xls"
			file = Excel.new(file_name)
			write_data_from_file(file)
			puts "data from xls imported!"
		when ".xlsx"
			file = Excelx.new(file_name)
			write_data_from_file(file)
			puts "data from xlsx imported!"
		when ".ods"
			file = Openoffice.new(file_name)
			write_data_from_file(file)
			puts "data from ods imported!"	
		when ".csv"
			write_data_from_csv(file_name)
      puts "data from csv imported!" 
		else
			puts "Extension is different then : xls, xlsx, ods or csv! Can't insert data."
	end
end

# =========== BEGIN ========== #

puts "Enter the path of data-file (must be *.xls, *.xlsx, *.ods or *.csv)"
file_name = STDIN.gets
#file_name = fore example: "db/dane.xls"
file_name.chomp!
insert_data_from_file_to_db(file_name)

# =========== END ============ #