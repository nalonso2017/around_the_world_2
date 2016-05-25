class Recommendation < ActiveRecord::Base
  has_many :likes , :class_name => "Like", :foreign_key => "recommendation_id"
belongs_to :user
belongs_to :city
end
