ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :phone, :status
  remove_filter :votes, :sms_verifications, :candidates, :nominations, :reset_password_token, :status

  scope :all, default: true

  index do
    selectable_column
    id_column
    column :email
    column :phone
    column :created_at
    column :status
    actions
  end

  filter :email
  filter :phone
  filter :status
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :phone
      f.input :status
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
