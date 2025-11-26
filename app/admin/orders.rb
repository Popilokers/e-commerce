ActiveAdmin.register Order do
  permit_params :customer_id
  actions :all, except: [:new, :create, :destroy, :edit]

  index do
    selectable_column
    id_column
    column :customer_id
    actions
  end

  filter :customer_id

  form do |f|
    f.inputs do
      f.input :customer_id
    end
    f.actions
  end

  show do
    attributes_table do
      row :customer_id
    end
  end

end
