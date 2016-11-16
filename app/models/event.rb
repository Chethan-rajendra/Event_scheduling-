class Event < ActiveRecord::Base
	belongs_to :host, class_name: "User"
	has_many :invites 
	has_many :user, through: :invites
end
