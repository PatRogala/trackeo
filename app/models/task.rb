class Task < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :completed, inclusion: { in: [true, false] }

  before_validation :set_default_completed

  scope :for_date, ->(date) { where(deadline: date.all_day) }

  def toggle!
    self.completed = !completed
    save!
  end

  private

  def set_default_completed
    self.completed ||= false
  end
end
