class CreateBookSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :book_suggestions do |t|
      t.string :author, null: false
      t.string :title, null: false
      t.string :link, null: false
      t.string :editorial
      t.string :publisher
      t.string :year
      t.float :price
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
