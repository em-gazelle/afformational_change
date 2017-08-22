namespace :db do
  desc "Handling Roles: Converting old database 'type' to new attributes (is_landlord, etc.)"
  task push_out_afformations: :environment do
    # to be run every hour
    @afformations = UserAfformation.where()

    ActiveRecord::Base.transaction do
      User.each do |user|
        if user.personal_afformations_submitted
          sendAfformation(user, UserAfformation.where(user_id: user.id).sample)
        else
          sendAfformation(user, Afformation.sample)
        end
      end
    end
    puts "Afformations Sent"
  end
end
