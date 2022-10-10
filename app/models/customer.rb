class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    has_many :game_scores
    
  
      
         
  def active_for_authentication?
    super && (is_deleted == false)
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
