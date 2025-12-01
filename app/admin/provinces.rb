ActiveAdmin.register Province do
  permit_params :name, :code

  index do
    selectable_column
    id_column
    column :name
    column :code
    actions
  end

  filter :customer_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :code
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :code
    end
  end

end
