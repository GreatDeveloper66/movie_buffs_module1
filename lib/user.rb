class User < ActiveRecord::Base
  has_many :movies, through: :views
end
