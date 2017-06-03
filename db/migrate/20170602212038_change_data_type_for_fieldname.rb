class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.1]
  # def change


  # def self.up
  #   change_table :users do |t|
  #     t.change :age, :date
  #   end
  # end
  # def self.down
  #   change_table :users do |t|
  #     t.change :age, :integer
  #   end
  # end

    # change_table :users do |t|
      # change_column :age, :date,
    # end

    # def change
    #   reversible do |dir|
    #     change_table :users do |t|
    #       dir.up   { t.change :age, :date }
    #       dir.down { t.change :age, :integer }
    #     end
    #   end
    # end

      # change_column :users, :age, "date USING CAST(age AS date) "
      # change_column :users, :age, "USING age::date"

  def self.up
    add_column :users, :birthday, :date
  end
end
