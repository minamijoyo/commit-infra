require 'aws-sdk'

# set environments
ec2 = Aws::EC2::Client.new(
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region: ENV['AWS_DEFAULT_REGION']
)

instance_id = ENV["INSTANCE_ID"]
terminate_response = ec2.terminate_instances(instance_ids: [instance_id])
