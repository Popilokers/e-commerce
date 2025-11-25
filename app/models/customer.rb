class Customer < ApplicationRecord
<<<<<<< HEAD

  def self.ransackable_attributes(auth_object = nil)
    ["carnumber", "created_at", "email", "first_name", "id", "last_name", "password", "points", "updated_at"]
  end

=======
  def self.ransackable_attributes(auth_object = nil)
    ["carnumber", "created_at", "email", "first_name", "id", "last_name", "password", "points", "updated_at"]
  end
>>>>>>> admin-dashboard
end
