class Employer < ApplicationRecord
  validates :employer, :date_started, :date_employment_ended, presence: true
end
