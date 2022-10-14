class Reason < ApplicationRecord
  enum status: { win: 0, lose: 1 }
  belongs_to :game_score
validates :title ,length: {minimum:1 ,maximum: 15 },presence: true

end
