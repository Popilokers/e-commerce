class Page < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "content", "slug"]
  end

  validates :title, presence:true
  validates :content, presence:true
  validates :slug, presence:true
end
