class AddShortText < ActiveRecord::Migration
  def up
    add_column :posts, :short_text, :text
  end

  def down
    remove_column :posts, :short_text
  end
end
