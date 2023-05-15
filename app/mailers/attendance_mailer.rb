class AttendanceMailer < ApplicationMailer
  default from: 'project-thp@laposte.net'

  def join_event_email(attendance)
      
    @attendance = attendance
    @new_user = User.find(@attendance.user_id)
    @event = @attendance.event
    @admin = User.find(@attendance.event.admin_id)
    @url = 'http://monsite.fr/login'

    mail(to: @admin.email, subject: 'Un utilisateur a rejoint votre événement !') 
  end
end
