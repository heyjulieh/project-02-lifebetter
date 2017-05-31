class CreateTips < ActiveRecord::Migration[5.1]
  def change
    create_table :tips do |t|
      t.string :genre
      t.string :title
      t.boolean :important
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
