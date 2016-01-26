class CreateTags < ActiveRecord::Migration
  def change
    crate_table :tags do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
