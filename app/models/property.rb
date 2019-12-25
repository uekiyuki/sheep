class Property < ApplicationRecord
  has_many :stations
  accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: proc { |attributes| attributes['name_station'].blank? }
  #editするときに子レコードを削除出来るようにする　allow_destroy: true
  validates :name,  presence: true, length: { in: 1..20 }
  validates :rent,  presence: true, length: { in: 1..10 }
  validates :address,  presence: true, length: { in: 1..50 }
  validates :age,  presence: true, length: { in: 1..10 }
  validates :note, length: { in: 1..50 }
end
