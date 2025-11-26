class Page < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "content", "slug"]
  end
end
