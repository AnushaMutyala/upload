class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.text :firstname
      t.text :lastname
      t.text :gender
      t.string :Are
      t.string :u
      t.boolean :eligible

      t.timestamps
    end
  end
end
