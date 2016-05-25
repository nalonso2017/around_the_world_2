class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :likes , :class_name => "Like", :foreign_key => "user_id"
       has_many :recommendations
       has_many :cities, :through => :recommendations
end
