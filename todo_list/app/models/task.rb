class Task < ActiveRecord::Base

  validates :title, presence: true
  validates :user, presence: true

  belongs_to :user
end
