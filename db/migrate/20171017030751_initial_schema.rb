
class InitialSchema < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :username
      t.string :password
    end
    create_table :restaurants do |t|
      t.string :name
      t.text :order
      t.string :place_id
      t.string :search_name
      t.string :address
      t.string :number
      t.string :hours
      t.string :website
      t.text :reviews
      t.float :lat
      t.float :lng
    end
    create_table :ratings do |t|
      t.references :user, foreign_key: {to_table: :users}, index: true
      t.references :restaurant, foreign_key: {to_table: :restaurants}, index: true
      t.datetime :created_at
      t.integer :rating
      t.text :review
      t.boolean :has_been
    end
  end
end