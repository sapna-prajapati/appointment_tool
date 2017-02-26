module ClientsHelper
  def appointment_availability(slot_id, date)
    slot = Slot.find_by(id: slot_id)
    if slot.appointments.find_by(date_created: date).present?
      return true
    end
  end

  def next_5_days
    Date.today..Date.today + 5.days
  end

  def get_slot_time(start_time, end_time)
    "#{start_time}:00 - #{end_time}:00"
  end
end
