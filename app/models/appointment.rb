class Appointment < ActiveRecord::Base
  belongs_to :slot
  belongs_to :client
  validates :slot_id, uniqueness: {scope: :date_created}  
end
