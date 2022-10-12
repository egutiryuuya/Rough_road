class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    has_many :game_scores
    has_many :favorites ,dependent: :destroy
    
    has_one_attached :customer_image
    
    def get_customer_image
      unless customer_image.attached?
        file_path = Rails.root.join('app/assets/images/noimage.png')
        customer_image.attach(io: File.open(file_path), filename: '218efd88e8e82a6843e43af00c39f00f',content_type: 'image/jpeg')
      end
      customer_image.variant(resize_to_limit: [200,200]).processed
    end
      
         
  def active_for_authentication?
    super && (is_deleted == false)
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
