class Slot < ActiveRecord::Base
  has_many :appointments, dependent: :destroy
end
