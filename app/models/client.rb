class Client < ActiveRecord::Base
  has_many :appointments, dependent: :destroy

  validates_presence_of :name, :mobile
  accepts_nested_attributes_for :appointments
end
