namespace :db do
  desc "Sending out daily afformations to users"
  task send_afformations: :environment do 

    # system "web: bundle exec puma -C config/puma.rb"
    # system "worker: bundle exec sidekiq -e production -C config/sidekiq.yml"  

    @admin_afformations = Afformation.where(user_id: nil)
    @random_admin_afformation = @admin_afformations.sample
    @admin_afformations_count = @admin_afformations.count

    @subscribed_users = User.where(deactivated: [nil, false])

    @random_image_file_name = random_image_from_directory

    @subscribed_users.each do |user|
      afformation = generate_random_afformation(user)

      UserMailer.delay.daily_afformation(user.id, afformation.id, @random_image_file_name)
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

def random_image_from_directory
    images_path_prefix = "app/assets/images/"
    image_files = Dir.glob("#{images_path_prefix}*")
    image_files.sample.remove(images_path_prefix)
end