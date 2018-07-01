class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.text :title
      t.text :description
      t.references :opener, foreign_key: { to_table: :users }
      t.references :paper, foreign_key: true
      t.boolean :closed, default: false

      t.timestamps
    end
    add_index :issues, %i[paper_id created_at]
  end
end
