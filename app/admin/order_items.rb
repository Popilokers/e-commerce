ActiveAdmin.register OrderItem do
  permit_params :order_id, :product_id, :cost
  actions :all, except: [:new, :create, :destroy, :edit]

  index do
    selectable_column
    id_column
    column :order_id
    column 'OrderItem' do |item|
      item.product.name  # display the name instead of product_id
    end
    column :cost
    actions
  end

  filter :order_id
  filter :product_id
  filter :cost

  form do |f|
    f.inputs do
      f.input :order_id
      f.input :product_id
      f.input :cost
    end
    f.actions
  end

  show do
    attributes_table do
      row :order_id
      row 'OrderItem' do |item|
        item.product.name  # display the name instead of product_id
      end
      row :cost
    end
  end
end