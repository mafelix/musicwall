class Signin<ActiveRecord::Base
  validates :email, presence: true
  validates :password, presence: true
end