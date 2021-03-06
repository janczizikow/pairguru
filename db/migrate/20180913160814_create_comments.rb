class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
