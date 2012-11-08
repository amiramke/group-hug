require_relative '../config'

class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :id_number
      t.string :site_version
      t.timestamps
    end
  end
end
