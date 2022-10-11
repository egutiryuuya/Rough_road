class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    has_many :game_scores
    
    has_many :favorites ,dependent: :destroy
      
         
  def active_for_authentication?
    super && (is_deleted == false)
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
