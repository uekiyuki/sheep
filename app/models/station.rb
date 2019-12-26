class Station < ApplicationRecord
  belongs_to :property, optional: true
  #子のレコードを保存する　optional:true
end
