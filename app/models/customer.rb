class Customer < ApplicationRecord
  belongs_to :account
  has_one :address, as: :addressable

  accepts_nested_attributes_for :address
end
