class MetroService < ApplicationRecord
  has_many :trains
    
  validates :source, presence: true
  validates :destination, presence: true

  self.per_page = 5
end


