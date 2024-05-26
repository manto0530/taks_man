class Task < ApplicationRecord
  belongs_to :user

  enum status: { backlog: 'Backlog', in_progress: 'In-progress', done: 'Done' }

  validates :title, :description, :status, :deadline, presence: true
  validate :deadline_must_be_in_future

  private

  def deadline_must_be_in_future
    if deadline.present? && deadline < DateTime.current
      errors.add(:deadline, "must be in the future")
    end
  end
end
