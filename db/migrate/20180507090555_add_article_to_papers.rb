class AddArticleToPapers < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :article, :string
  end
end
