ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :price, :stock_quantity, :category_id


  filter :name
  filter :description
  filter :price
  filter :stock_quantity
  filter :category_id

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
      f.input :description
      f.input :stock_quantity
      f.input :price
      f.input :category_id
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :stock_quantity
    column :price
    column 'Category' do |product|
      product.category.name  # display the name instead of category_id
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :stock_quantity
      row :points
      row 'Category' do |product|
        product.category.name  # display the name instead of category_id
      end
    end
  end
end
