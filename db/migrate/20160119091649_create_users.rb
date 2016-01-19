class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :sex
      t.string :avatar_uid
      t.string :avatar_name
      t.string :state
      t.timestamps null: false
    end
  end
end
