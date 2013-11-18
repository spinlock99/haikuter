class Haiku < ActiveRecord::Base
  belongs_to :user

  validates :poem,    presence: true
  validates :user_id, presence: true
end
