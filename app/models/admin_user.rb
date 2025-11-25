class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
<<<<<<< HEAD
    %w[id email created_at updated_at]
=======
    ["id", "email", "created_at", "updated_at"]
>>>>>>> admin-dashboard
  end
end
