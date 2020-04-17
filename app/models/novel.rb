class Novel < ApplicationRecord
  belongs_to :user
  has_many :badges

  validates :title, presence: true

  before_save :default_values

  def default_values
    self.wordcount ||= 0 # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end
end
