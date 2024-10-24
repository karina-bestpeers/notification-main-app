ActiveAdmin.register User do
  permit_params :email, :name, :age, :phone_number, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :age
    column :phone_number
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :created_at

  show do
    attributes_table do
      row :id
      row :email
      row :age
      row :name
      row :phone_number
      row :created_at
    end

    panel 'Notification Logs' do
      notification_logs = NotificationsEngine::NotificationLog.where(user_id: resource.id)
      table_for notification_logs do
        column :id
        column :status
        column :notification_type
        column :created_at
        column :notification
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :age
      f.input :phone_number
    end
    f.actions
  end
end
