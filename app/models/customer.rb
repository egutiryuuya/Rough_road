class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
         has_many :game_scores
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
