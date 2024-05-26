class Task < ApplicationRecord
  belongs_to :user

  enum status: { backlog: 'Backlog', in_progress: 'In-progress', done: 'Done' }

  validates :title, :description, :status, :deadline, presence: true
  validate :deadline_must_be_in_future

  # after_create :schedule_reminder_jobs

  def deadline_must_be_in_future
    if deadline.present? && deadline < DateTime.current
      errors.add(:deadline, "must be in the future")
    end
  end

  def self.check_deadlines
    tasks = where('deadline >= ? AND deadline <= ?', 1.day.from_now, 1.hour.from_now).where.not(status: :done)
    tasks.each do |task|
      ReminderEmailJob.perform_later(task.id)
    end
  end
end