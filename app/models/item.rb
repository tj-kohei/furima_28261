class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee 
  belongs_to_active_hash :from_location
  belongs_to_active_hash :days_till_ship


  with_options presence: true do
  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :status_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1 }
  validates :from_location_id, presence: true, numericality: { other_than: 1 }
  validates :days_till_ship_id, presence: true ,numericality: { other_than: 1 }
  validates :price, inclusion: { in: (300..9999999)}
  
  end
  
  
  
  belongs_to :user
  has_one    :purchase
  has_one_attached :image
end
