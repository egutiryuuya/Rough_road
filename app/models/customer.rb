class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    has_many :game_scores
    has_many :favorites ,dependent: :destroy
    
    has_one_attached :customer_image
    
    def get_customer_image
      unless image.attached?
        画像がありません
      end
      image.variant(resize_to_limit: [200,200]).processed
    end
      
         
  def active_for_authentication?
    super && (is_deleted == false)
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
