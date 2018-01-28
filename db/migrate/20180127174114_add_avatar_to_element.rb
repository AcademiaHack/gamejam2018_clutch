class AddAvatarToElement < ActiveRecord::Migration[5.1]
  def up
    add_attachment :elements, :avatar
  end

  def down
    remove_attachment :elements, :avatar
  end
end
