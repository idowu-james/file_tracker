# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#country_list = [
#  [ "Germany", 81831000 ],
#  [ "France", 65447374 ],
#  [ "Belgium", 10839905 ],
#  [ "Netherlands", 16680000 ]
#  ]

#country_list.each do |name, population|
# Country.create( name: name, population: population )
#end
	
	#home_list = ['james', 'nk', 'numi', 'teslim']
	Admin.create(:username => 'naseni', :password => 'naseni')
	Office.create(:name => 'ICT')
	department_list = [
		['Engineering Infrastructure','Dr Dauda'], 
		['Science Infrastructure' ,'Mrs Adams'],
		['Admin', 'Hasan']
	]
	# home_list.each do |home|
	# 	Home.create(index: home)
	# end

	
	department_list.each do |name ,head|
		Department.create(name: name, head: head)
	end

	Category.create([{name: 'Personal'}, {name: 'Secret'}, {name: 'Business'}])