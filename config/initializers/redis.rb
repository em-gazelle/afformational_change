uri = URI.parse( ENV["REDIS_URL"] || "redis://localhost:6379/" )

Resque.redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)