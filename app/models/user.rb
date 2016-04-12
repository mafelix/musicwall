class User<ActiveRecord::Base
  has_many :musics
  validates :email, presence: true
  validates :password, presence: true
end