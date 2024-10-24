# This migration comes from notifications_engine (originally 20241024065501)
class RenameTypeColumnInNotificationLogs < ActiveRecord::Migration[7.1]
  def change
    rename_column :notifications_engine_notification_logs, :type, :notification_type
  end
end
