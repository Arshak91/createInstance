#!bin/bash

function checkIGW() {
    $VPC_ID=$1
    IGW_ID=$(aws ec2 describe-internet-gateways \
        --filters Name=attachment.vpc-id,Values="$VPC_ID" \
        --query 'InternetGateways[*].InternetGatewayId' \
        --output text
    )

    echo "Internet Gateway ID: $IGW_ID"
}
