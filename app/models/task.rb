class Task < ApplicationRecord
  belongs_to :user

  enum status: { backlog: 'Backlog', in_progress: 'In-progress', done: 'Done' }

  # validates :deadline, presence: true
  # validate :deadline_within_range

  # private

  # def deadline_within_range
  #   if deadline.present? && (deadline < Date.current || deadline >= Date.current + 1.day)
  #     errors.add(:deadline, "must be today and within 24 hours")
  #   end
  # end
end
