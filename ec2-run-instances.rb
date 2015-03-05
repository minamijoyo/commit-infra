require 'aws-sdk'

# set environments
ec2 = Aws::EC2::Client.new(
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region: ENV['AWS_DEFAULT_REGION']
)

# aws ec2 run-instances options
# Note: security_group_ids can not use network_interfaces simultaneously.
#       So use network_interfaces:groups
ec2_options = {
  dry_run: false,
  image_id: "ami-18869819",
  min_count: 1,
  max_count: 1,
  key_name: "aws-wercker",
#  security_group_ids: ["sg-48b7002d"],
  instance_type: "t2.micro",
  placement: {
    availability_zone: "ap-northeast-1a"
  },
  block_device_mappings: [
    {
      device_name: "/dev/xvda",
      ebs: {
        volume_size: 8,
        delete_on_termination: true,
        volume_type: "gp2"
      }
    },
  ],
  monitoring: {
    enabled: false,
  },
  disable_api_termination: false,
  network_interfaces: [
    {
      device_index: 0,
      subnet_id: "subnet-6b55851c",
      groups: ["sg-48b7002d"],
      delete_on_termination: true,
      associate_public_ip_address: true
    },
  ],
  ebs_optimized: false
}

# run instance
run_response = ec2.run_instances(ec2_options)

# get instance_id from API response
instance_id = run_response.data.instances[0].instance_id

# wait until :instance_status_ok
# :instance_running is insufficient state for ssh
# :instance_status_ok ensures instance network reachability
ec2.wait_until(:instance_status_ok,  instance_ids:[instance_id])

# get public ip address
describe_response = ec2.describe_instances(instance_ids: [instance_id])
target_ip = describe_response.data.reservations[0].instances[0].public_ip_address

# output result to stdout
puts "export TARGET_IP=#{target_ip}"
puts "export INSTANCE_ID=#{instance_id}"
