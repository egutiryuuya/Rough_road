class GameScore < ApplicationRecord
  belongs_to :game_title
  belongs_to :customer
  has_many :reasons,dependent: :destroy
  
  def winrate
    if self.reasons.where(status: "win").count==0
     '0'
    else
    self.reasons.where(status: "win").count*100/self.reasons.count
    end
  end
end
