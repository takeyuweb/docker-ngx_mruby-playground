r = Nginx::Request.new

key = r.var.arg_key
value = r.var.arg_value

Nginx.echo "key: #{key}"
Nginx.echo "value: #{value}"

redis = Redis.new('redis', 6379)
redis.set(key, value)
