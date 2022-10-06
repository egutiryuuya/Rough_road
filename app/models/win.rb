class Win < ApplicationRecord
  belongs_to :game_title
  has_many :win_reasons,dependent: :destroy
  belongs_to :customer
end
