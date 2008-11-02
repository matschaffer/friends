#
#  Controller.rb
#  Friends
#
#  Created by Mat Schaffer on 10/31/08.
#  Copyright (c) 2008 Mat Schaffer. All rights reserved.
#

require 'csv'

class Controller
	STORAGE = '/Users/schapht/friends.csv'
	attr_writer :friendsTableView
	
	def addFriend(sender)
		@friends << Friend.new(:first_name => 'John', :last_name => 'Smith')
		@friendsTableView.reloadData
	end
	
	def removeFriend(sender)
		@friends.delete_at(@friendsTableView.selectedRow)
		@friendsTableView.reloadData
	end
	
	def loadData(sender)
		CSV.open(STORAGE, 'r') do |csv|
			csv.each do |row|
				friend = Friend.new
				friend.from_row(row)
				@friends << friend
			end
		end if File.exist?(STORAGE)
	end
	
	def saveData(sender)
		CSV.open(STORAGE, 'w') do |csv|
			@friends.each { |f| csv << f.to_row }
		end
	end
	
	def awakeFromNib()
		@friends = []
		@friendsTableView.dataSource = self
	end
	
	def numberOfRowsInTableView(view)
		@friends.size
	end
	
	def tableView(view, objectValueForTableColumn:column, row:index)
		@friends[index].send(column.identifier)
	end
	
	def tableView(view, setObjectValue:object, forTableColumn:column, row:index)
		@friends[index].send("#{column.identifier}=", object)
	end
end
