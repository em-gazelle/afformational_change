Sidekiq::Extensions.enable_delay!

Sidekiq.options.merge!(YAML.load_file(Rails.root.join('config/sidekiq.yml')))


Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'], namespace: "daily-afformations" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'], namespace: "daily-afformations"}
end

if Rails.env.development?
  require 'sidekiq/testing'
  Sidekiq::Testing.inline!
end
