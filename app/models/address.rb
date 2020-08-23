class Address < ApplicationRecord
  POSTAL_CODE_REGEX = /\A[0-9]{3}[-][0-9]{4}\z/
  PHONE_NUMBER_REGEX = /\A[0-9]{11}\z/
  
  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE_REGEX, message: 'is invalid. Input half-width numbers contain hyphen'}
    validates :from_location_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX, message: 'is invalid. Input half-width numbers without hyphen'}
  end
  belongs_to :purchase
end
