ActiveAdmin.register Page do
  permit_params :title, :content
  actions :all, except: [:destroy]

  index do
    selectable_column
    id_column
    column :title
    column :content
    actions
  end

  filter :content
  filter :title

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :content
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :content
    end
  end

end
