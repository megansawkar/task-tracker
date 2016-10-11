class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, length: { minimum: 3 }, presence: true
  validates :user, presence: true

  scope :visible_to, -> (user) { user ? all : where(public: true) }

end
