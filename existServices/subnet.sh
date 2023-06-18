#!bin/bash

function checkSubnet() {
    $vpcId=$1
    subnetId=igw2=$( aws ec2 describe-subnets \
        --filters "Name=vpc-id,Values=$vpcId"
        --query 'Subnets[0]' \
        --output json \
        2>&1
    )
    echo $subnetId
}
