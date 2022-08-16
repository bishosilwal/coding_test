class Person < ApplicationRecord

  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validates :phone, presence: true

  before_validation :validates_phone

  def validates_phone
    phone_validator = Phonelib.parse(self.phone)
    self.errors.add(:phone, :invalid, message: 'is invalid' ) unless phone_validator.valid?
  end
end
