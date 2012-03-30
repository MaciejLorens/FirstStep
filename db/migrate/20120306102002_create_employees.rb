class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :surname
      t.string :name
      t.integer :employee_title_id
      t.integer :employee_group_id
      t.integer :employment_id
      t.integer :academy_unit_id
      t.integer :college_id
      t.integer :building_id
      t.string :room
      t.string :phone_number
      t.integer :academy_college_id
      t.string :www
      t.string :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
