#!bin/bash

function checkIGW() {
    $VPC_ID=$1
    gatewayId=igw2=$( aws ec2 describe-internet-gateways \
        --filters Name=attachment.vpc-id,Values="$VPC_ID" \
        --query 'InternetGateways[0].InternetGatewayId' \
        --output text \
        2>&1
    )
}
