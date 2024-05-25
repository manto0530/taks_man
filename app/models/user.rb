class User < ApplicationRecord
  
  has_many :tasks
  

  devise :database_authenticatable, :registerable, :confirmable, :lockable, :timeoutable, :trackable, 
         :recoverable, :rememberable, :validatable
end
