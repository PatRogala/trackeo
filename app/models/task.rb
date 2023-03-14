class Task < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :completed, inclusion: { in: [true, false] }

  before_validation :set_default_completed

  private

  def set_default_completed
    self.completed ||= false
  end
end
