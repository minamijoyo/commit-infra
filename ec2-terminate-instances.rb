require 'aws-sdk'

# set environments
puts "initialize client"
ec2 = Aws::EC2::Client.new(
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region: ENV['AWS_DEFAULT_REGION']
)

instance_id = ENV["INSTANCE_ID"]
puts "INSTANCE_ID=#{instance_id}"

puts "terminate instance"
terminate_response = ec2.terminate_instances(instance_ids: [instance_id])
puts "#{terminate_response}"
