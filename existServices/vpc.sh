#!bin/bash

function checkVpc() {
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/.."
    id=$(echo $1 | grep 'vpc-')
    vpcId=$1
    name=$2
    vpcCidrBlock=$3
    if [ $id ];
    then
        vpc=$( aws ec2 describe-vpcs --vpc-ids $id \
        --query '.Vpcs[0].VpcId' \
        --output text \
        2>&1)
        if [[ $? -ne 0 ]];
        then
            read -p "This VPC does't exist. Are you want to create new VPC? [Y/n]: " flag
            ans=$(echo $flag | grep -E '\by|Y|yes|YES|Yes\b')
            if [[ $ans ]];
            then
                source "$SCRIPT_DIR/createVpc.sh"
                createVpc "$name" "$vpcCidrBlock"
            else
                source "$SCRIPT_DIR/cleanup.sh"
                cleanUp
                return
            fi
        fi
    else
        read -p "It is unavailable ID can I take default VPC? [Y/n]: " flag
        ans=$(echo $flag | grep -E '\by|Y|yes|YES|Yes\b')
        if [[ $ans ]];
        then
            vpc=$(aws ec2 describe-vpcs --filters "Name=isDefault,Values=true")
            vpcId=$(echo -e "$vpc" |  /usr/bin/jq '.Vpcs[0].VpcId' | tr -d '"')
        else
            source "$SCRIPT_DIR/cleanup.sh"
            cleanUp
            return
        fi
    fi
}
