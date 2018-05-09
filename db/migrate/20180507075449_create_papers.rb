class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.text :title
      t.text :description
      t.string :field
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :papers, %i[user_id created_at]
  end
end
