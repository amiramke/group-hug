require_relative '../config'

class CreateConfessions < ActiveRecord::Migration
  def change
    create_table(:confessions) do |t|
      t.string :content
      t.references :user
      t.timestamps
    end
  end
end
