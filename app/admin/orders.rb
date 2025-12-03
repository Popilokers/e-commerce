ActiveAdmin.register Order do
  permit_params :customer_id, :payment_id, :total, :pst, :gst, :hst, :status
  actions :all, except: [:new, :create]

  index do
    selectable_column
    id_column
    column :customer_id do |order|
      order.customer.full_name
    end
    column :payment_id
    column :total
    column :pst
    column :gst
    column :hst
    column :status do |order|
      case order.status
      when 0
        "Not Ready"
      when 1
        "Ready for Pickup"
      when 2
        "Picked up"
      end
    end
    actions
  end

  filter :customer_id

  form do |f|
    f.inputs do
      f.input :pst, min:0,max:1
      f.input :gst, min:0,max:1
      f.input :hst, min:0,max:1
      f.input :status, min:0,max:2
    end
    f.actions
  end

  show do
    attributes_table do
      row :customer_id
      row Customer do |order|
        order.customer.full_name
      end
      row :payment_id
      row :total
      row :pst
      row :gst
      row :hst
      row :status do |order|
  case order.status
  when 0
    "Not Ready"
  when 1
    "Ready for Pickup"
  when 2
    "Picked up"
  end
      end
    end
  end

end
