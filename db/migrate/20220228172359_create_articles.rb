class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :text
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
