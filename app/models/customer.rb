class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    #フォローした、されたの関係
    has_many :relationships, class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
    has_many :reverse_of_relationships,class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
    
    #一覧画面で使う
    has_many :followings,through: :relationships, source: :followed
    has_many :followers,through: :reverse_of_relationships, source: :follower
         
    has_many :game_scores
    has_many :favorites ,dependent: :destroy
    
    validates :name, presence: true, uniqueness: true,length: { in: 1..15 }
    validates :profile ,length: {maximum: 50 }
    has_one_attached :customer_image
    
    def get_customer_image
      unless customer_image.attached?
        file_path = Rails.root.join('app/assets/images/noimage.png')
        customer_image.attach(io: File.open(file_path), filename: 'default-image.png',content_type: 'image/png')
      end
      customer_image.variant(resize_to_limit: [200,200]).processed
    end
    
    def self.looks(word)
        @customer = Customer.where("name LIKE?","%#{word}%")
    end

    def active_for_authentication?
      super && (is_deleted == false)
    end
    
    def follow(customer_id)
      relationships.create(followed_id: customer_id)
    end
    
    # フォローを外す処理
    def unfollow(customer_id)
      relationships.find_by(followed_id: customer_id).destroy
    end
    
    def following?(customer)
      followings.include?(customer)
    end
 
end
