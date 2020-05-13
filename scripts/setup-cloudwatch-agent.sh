#!/bin/bash

# exit if any failure occurred
set -o errexit
set -o nounset
set -o pipefail

# install cloudwatch agent
CLOUDWATCH_AGENT_DEB_LINK="https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb"
wget -O amazon-cloudwatch-agent.deb "${CLOUDWATCH_AGENT_DEB_LINK}"
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
rm -vf ./amazon-cloudwatch-agent.deb

# generate cloudwatch agent config
cat > cloudwatch-agent-config.json <<-EOF
{
	"agent": {
		"metrics_collection_interval": 60,
		"run_as_user": "root"
	},
	"metrics": {
		"append_dimensions": {
			"AutoScalingGroupName": "\${aws:AutoScalingGroupName}",
			"ImageId": "\${aws:ImageId}",
			"InstanceId": "\${aws:InstanceId}",
			"InstanceType": "\${aws:InstanceType}"
		},
		"metrics_collected": {
			"disk": {
				"measurement": [
					"used_percent"
				],
				"metrics_collection_interval": 60,
				"resources": [
					"*"
				]
			},
			"mem": {
				"measurement": [
					"mem_used_percent"
				],
				"metrics_collection_interval": 60
			},
			"statsd": {
				"metrics_aggregation_interval": 60,
				"metrics_collection_interval": 10,
				"service_address": ":8125"
			}
		}
	}
}
EOF

# setup cloudwatch agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:cloudwatch-agent-config.json -s
rm -vf cloudwatch-agent-config.json
