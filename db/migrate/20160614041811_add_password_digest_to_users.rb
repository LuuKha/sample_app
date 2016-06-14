class Add1NewCollumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :birth_day, :datetime
    add_column :users, :sex, :integer
  end
end