#!/bin/bash

r() {
  
}

start() {
  instance=$(
    aws ec2 run-instances \
      --launch-template LaunchTemplateName=${TEMPLATE:-webtmp} \
      --user-data file://user-data.sh \
      --query 'Instances[0].InstanceId' \
      --output text
  )
}

getinstance() {
  instance=$(
    aws ec2 describe-instances \
      --query=Reservations[0].Instances[0].InstanceId \
      --filters "Name=instance-state-name,Values=running" \
      --output text
  )
}
getip() {
  ip=$(
      aws ec2 describe-addresses \
        --query 'Addresses[0].PublicIp' \
        --output text
  )
}
assoc() {
  aws ec2 associate-address \
    --instance-id $instance \
    --public-ip $ip
}

tag() {
  aws ec2 create-tags \
    --resources ${instance} \
    --tags Key=Name,Value=webserver Key=Owner,Value=${USER}
}