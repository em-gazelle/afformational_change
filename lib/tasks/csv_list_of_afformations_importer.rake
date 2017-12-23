require 'csv'

namespace :db do
  desc "Importing larger lists of afformations from a CSV file. For general use, admins. Must have full file path"
  # run with rake db:import_afformations_from_csv[:file_path]

  task :import_afformations_from_csv, [:file_path] => [:environment] do |task, csv|
    csv_text = File.read(csv[:file_path])
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
      Afformation.create!(row.to_hash.compact)
    end
  end
end
