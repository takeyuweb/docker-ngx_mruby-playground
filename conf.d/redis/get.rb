r = Nginx::Request.new

key = r.var.arg_key

redis = Redis.new('redis', 6379)
if redis.exists?(key)
  value = redis.get(key)

  Nginx.echo "key: #{key}"
  Nginx.echo "value: #{value}"
else
  Nginx.echo "key: #{key}"
  Nginx.echo "value: (not found)"
end
