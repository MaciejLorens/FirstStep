class AddRateToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :rate, :int
  end

  def self.down
    remove_column :posts, :rate
  end
end
