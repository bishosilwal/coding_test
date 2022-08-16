class Employment < ApplicationRecord
  belongs_to :employer, class_name: "Person", foreign_key: "person_id"

  validates :date_started, presence: true
  validates :employment_date_ended, presence: true

end
