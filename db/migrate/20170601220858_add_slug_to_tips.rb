class AddSlugToTips < ActiveRecord::Migration[5.1]
  def change
    add_column :tips, :slug, :string
    add_index :tips, :slug, unique: true
  end
end
