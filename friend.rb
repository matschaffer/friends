#
#  friend.rb
#  Friends
#
#  Created by Mat Schaffer on 10/31/08.
#  Copyright (c) 2008 Mat Schaffer. All rights reserved.
#

class Friend
	KEYS = [:first_name, :last_name, :phone_number, :email_address]
	KEYS.each { |k| attr_accessor k }
	
	def initialize(*args)
		args.last.each { |k, v| send("#{k}=", v) } if args.last
	end
	
	def from_row(row)
		i = 0
		p i
	end
	
	def to_row
		KEYS.inject([]) { |row, key| row << send(key) }
	end
end
