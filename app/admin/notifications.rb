ActiveAdmin.register NotificationsEngine::Notification do
  actions :all, except: [:new]

  index do
    selectable_column
    id_column
    column :user_id
    column :status
    column :channel
    column :message
    column :created_at
  end

  filter :status
  filter :channel
  filter :created_at

  show do
    attributes_table do
      row :id
      row :status
      row :message
      row :created_at
    end
  end
end
