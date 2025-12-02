ActiveAdmin.register Province do
  permit_params :name, :code, :gst,:pst,:hst

  index do
    selectable_column
    id_column
    column :name
    column :code
    column :gst
    column :pst
    column :hst
    actions
  end

  filter :customer_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :code
      f.input :gst, max: 1
      f.input :pst, max: 1
      f.input :hst, max: 1
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :code
      row :gst
      row :pst
      row :hst
    end
  end

end
