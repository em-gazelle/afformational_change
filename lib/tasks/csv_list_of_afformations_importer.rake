require 'csv'

namespace :db do
  desc "Importing larger lists of afformations from a CSV file. For general use, admins"
  task import_afformations_from_csv: :environment do

    csv_text = File.read('lib/assets/afformations_csv.csv')
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
      Afformation.create!(row.to_hash.compact)
    end
  end
end
