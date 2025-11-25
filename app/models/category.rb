class Category < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name"]
  end
end
