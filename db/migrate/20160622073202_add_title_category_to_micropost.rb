class AddTitleCategoryToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :title, :string
    add_column :microposts, :category, :integer
  end
end
