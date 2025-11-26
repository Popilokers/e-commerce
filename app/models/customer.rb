class Customer < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["cardumber", "created_at", "email", "first_name", "id", "last_name", "password", "points", "updated_at"]
  end
  def full_name
    "#{first_name} #{last_name}"
  end
end
