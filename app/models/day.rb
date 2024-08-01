class Day < ApplicationRecord
  has_many :tasks, dependent: :destroy

  def self.ensure_days_for_month(date)
    beginning_of_month = date.beginning_of_month.beginning_of_week(:sunday)
    end_of_month = date.end_of_month.end_of_week(:sunday)

    (beginning_of_month..end_of_month).each do |date|
      find_or_create_by(date: date)
    end
  end
end
