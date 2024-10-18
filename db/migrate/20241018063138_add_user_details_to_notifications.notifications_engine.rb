# This migration comes from notifications_engine (originally 20241016132613)
class AddUserDetailsToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications_engine_notifications, :user_details, :json
  end
end
