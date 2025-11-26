ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :email, :cardnumber, :points, :address,:province


  filter :first_name
  filter :last_name
  filter :email

  # filter :image_attached, as: :boolean, label: "Has Image?"  # Rails 6+ ActiveStorage

  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :cardnumber
    actions
  end

 form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :address
      f.input :province
      f.input :email
      if f.object.new_record?
        f.input :password
      end
      f.input :cardnumber
      f.input :points
    end
    f.actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :password_digest
      row :cardnumber
      row :points
    end
  end
end
