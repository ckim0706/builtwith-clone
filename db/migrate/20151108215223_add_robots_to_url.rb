class AddRobotsToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :robots, :boolean
  end
end
