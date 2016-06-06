class Recommendation < ActiveRecord::Base

validates :name, :presence => true, :uniqueness => {:scope => :city_id}

validates :category, :presence => true

has_many :likes , :class_name => "Like", :foreign_key => "recommendation_id"
belongs_to :user
belongs_to :city
end
