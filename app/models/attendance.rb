class Attendance < ApplicationRecord
  after_create :user_join_event_email

  belongs_to :user
  belongs_to :event

  def user_join_event_email
    AttendanceMailer.join_event_email(self).deliver_now
  end

end
