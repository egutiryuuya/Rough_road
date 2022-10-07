class Reason < ApplicationRecord
  enum status: { win: 0, lose: 1 }
  belongs_to :game_score
end
