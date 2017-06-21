# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'csv'

csv_text = File.read('lib/seeds/afformations_csv.csv')
csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

csv.each do |row|
	row_separated_by_new_line = row.to_hash
	row_separated_by_new_line.each_with_index do |(attribute, value), index|
		if attribute.nil?
			row_separated_by_new_line.values[index - 1] << ", " + value
			row_separated_by_new_line.delete(attribute)
		end
	end
	Afformation.create!(row_separated_by_new_line) #rescue binding.pry
end


Customer.create!(email: "emmaf9@gmail.com", name: "Emily", phone: "510.533.7989")
