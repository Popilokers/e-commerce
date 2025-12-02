ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :price, :in_stock, :category_id, :image


  filter :name
  filter :description
  filter :price
  filter :in_stock
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
      f.input :in_stock
      f.input :price, min: 0.0001
      f.input :category_id
      # Upload field
      f.input :image, as: :file, hint: (
        f.object.image.attached? ?
          image_tag(url_for(f.object.image), style: "width: 80px; height:auto; max-height: 90px") :
          content_tag(:span, "No image uploaded yet")
      )
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :in_stock
    column :price
    column "Category" do |product|
      product.category.name  # display the name instead of category_id
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :in_stock
      row "Category" do |product|
        product.category.name  # display the name instead of category_id
      end
      row :image do |product|
        if product.image.attached?
          image_tag url_for(product.image), style: "max-width: 300px"
        else
          "No image"
        end
      end
    end
  end
end
