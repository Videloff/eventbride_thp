class AttendancesController < ApplicationController

  def new
    @attend = Attendance.new
    @event = Event.find(params[:event_id])
    @registered = false
    @check = @event.attendances.all.find_by(user_id: current_user.id)
    if @check
      @registered = true
    end
  end

  def create
    @event = Event.find(params[:event_id])
    @count = @event.users.all.count
    Attendance.create(user_id: current_user.id, event_id: params[:event_id])
  end

end