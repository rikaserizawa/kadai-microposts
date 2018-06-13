class Micropost < ApplicationRecord
  belongs_to :user
  
  # お気に入り
  has_many :favorites, dependent: :destroy
  has_many :favs, through: :favorites, source: :user
  #has_many :users, through: :favorites

  
  #バリデーション
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 255}
  
    # お気に入り 
  def fav(other_user)
      self.favorites.find_or_create_by(user_id: other_user.id)
  end

  def unfav(other_user)
    favorite = self.favorites.find_by(user_id: other_user.id)
    favorite.destroy if favorite
  end

  def faving?(other_user)
    self.favs.include?(other_user)
  end
end  


