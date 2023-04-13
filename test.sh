#!bin/bash


IGW_INFO=$(aws ec2 describe-internet-gateways \
  --internet-gateway-ids "igw-077863aefc4708989" \
  --output json)

vpc=$( aws ec2 describe-vpcs --vpc-ids "vpc-03d757463d0b56b9f" 2>&1)

echo "Internet Gateway Info: $IGW_INFO"
echo "VPC Info: $vpc"
