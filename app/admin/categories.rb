ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name


  filter :name

  # filter :image_attached, as: :boolean, label: "Has Image?"  # Rails 6+ ActiveStorage

  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

 form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
    end
  end
end
