class AddBootstrapToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :bootstrap, :boolean
  end
end
