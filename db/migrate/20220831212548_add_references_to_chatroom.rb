class AddReferencesToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :reservation, index: true
    add_reference :chatrooms, :walker, index: true
    add_reference :chatrooms, :user, index: true
  end
end
