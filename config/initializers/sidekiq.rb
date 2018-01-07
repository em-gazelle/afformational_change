# Sidekiq.configure_server do |config|
#   config.redis = { url: 'redis://localhost:6379/0', namespace: "app3_sidekiq_#{Rails.env}" }
# end

# Sidekiq.configure_client do |config|
#   config.redis = { url: 'redis://localhost:6379/0', namespace: "app3_sidekiq_#{Rails.env}" }
# end

Sidekiq::Extensions.enable_delay!

Sidekiq.options.merge!(YAML.load_file(Rails.root.join('config/sidekiq.yml')))

# Sidekiq.configure_server do |config|
#   config.redis = { url: 'redis://localhost:6379/0', namespace: "app3_sidekiq_#{Rails.env}" }
# end

# Sidekiq.configure_client do |config|
#   config.redis = { url: 'redis://localhost:6379/0', namespace: "app3_sidekiq_#{Rails.env}" }
# end

if Rails.env.development?
  require 'sidekiq/testing'
  Sidekiq::Testing.inline!
end
