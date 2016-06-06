class City < ActiveRecord::Base

validates :name, :presence => true, :uniqueness=> {:scope => :country}

  has_many :recommendations, :dependent => :destroy
  has_many :users, :through => :recommendations

end
