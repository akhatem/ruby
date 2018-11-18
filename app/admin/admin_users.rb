ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :name, :login_count, :current_logged_in

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :current_logged_in
    column :login_count
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :login_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
