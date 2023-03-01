class PersonalDatum < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, format: { with: /\A\d{3}-\d{3}-\d{4}\z/ }

  has_many :employers, dependent: :destroy

  accepts_nested_attributes_for :employers
end
