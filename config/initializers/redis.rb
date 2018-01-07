# uri = ENV["REDIS_URL"] || "redis://localhost:6379/"
# REDIS = Redis.new(url: uri)

if Rails.env.production?
  Rails.logger.info "production env: Redis: #{ENV['REDIS_URL']}"
  puts "production: #{ENV['REDIS_URL']}"

  uri = URI.parse(ENV["REDIS_URL"])
else
  Rails.logger.info "production env: Redis: #{ENV['REDIS_URL']}"
  puts "production: #{ENV['REDIS_URL']}"

  uri = URI.parse("redis://localhost:6379")
end
Resque.redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
Rails.logger.info "Resque.redis in intit/redis.rb returns: #{Resque.redis}"