class Supplier < ActiveRecord::Base
	#has_and_belongs_to_many :cosmetics
  	validates_presence_of :name
  	validates_uniqueness_of :name
  	validates_length_of :name, :in => 2..255
end
