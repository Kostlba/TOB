ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :address, :why, :fullname, :status_id

form do |f|
    f.inputs do
      f.input :address
      f.input :why
      f.input :fullname
      f.input :status_id, :as => :select, :collection => Status.all.map{|u| ["#{u.name}", u.id]}
    end
   f.actions
end
end
