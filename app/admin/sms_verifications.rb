ActiveAdmin.register SmsVerification do
  # permit_params do
  #   permitted = [:phone, :user_id, :status, :code]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :phone, :user_id, :status, :code
end
