class AddContentToTips < ActiveRecord::Migration[5.1]
  def change
    add_column :tips, :content, :string
  end
end
