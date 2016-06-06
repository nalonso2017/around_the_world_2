class Like < ActiveRecord::Base
  belongs_to :user , :class_name => "User", :foreign_key => "user_id"
belongs_to :recommendation , :class_name => "Recommendation", :foreign_key => "recommendation_id"

validates :user_id, :presence => true, :uniqueness=> {:scope => :recommendation_id}

end
