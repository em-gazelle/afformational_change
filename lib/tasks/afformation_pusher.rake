namespace :db do
  desc "Sending out daily afformations to users"
  task send_afformations: :environment do

    @admin_afformations = Afformation.where(user_id: nil)
    @random_admin_afformation = @admin_afformations.sample
    @admin_afformations_count = @admin_afformations.count

    @subscribed_users = User.where(deactivated: [nil, false])


    @subscribed_users.each do |user|
      afformation = generate_random_afformation(user)

      UserMailer.daily_afformation(user, afformation).deliver_now
    end

  end
end

def generate_random_afformation(user)
 
  if user.afformations.blank?
    @random_admin_afformation
  else
    @personal_afformations = Afformation.where(user_id: user.id)
    @personal_afformations_count = @personal_afformations.count

    if rand < (@personal_afformations_count / (@personal_afformations_count + @admin_afformations_count).to_f)
      @personal_afformations.sample
    else
      @random_admin_afformation
    end
  end
end