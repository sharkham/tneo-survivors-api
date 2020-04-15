class Novel < ApplicationRecord
  belongs_to :user
  has_many :badges

  validates :title, presence: true

end
