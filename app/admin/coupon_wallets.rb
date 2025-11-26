ActiveAdmin.register CouponWallet do
  permit_params :customer_id, :coupon_id, :amount

  actions :all, except:[:destroy]

  index do
    selectable_column
    id_column
    column 'Customer' do |customer|
      customer.customer.full_name
    end
    column 'Coupon' do |coupon|
      coupon.coupon.name
    end
    column :amount
    actions
  end

  filter :customer_id
  filter :coupon_id
  filter :amount

  form do |f|
    f.inputs do
      f.input :customer_id
      f.input :coupon_id
      f.input :amount
    end
    f.actions
  end

  show do
    attributes_table do
      row 'Customer' do |customer|
        customer.customer.full_name
      end
      row 'Coupon' do |coupon|
        coupon.coupon.name
      end
      row :amount
    end
  end

end
