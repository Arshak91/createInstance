#!bin/bash







ports="80 22 443 444"
if [[ $ports =~ ^([0-9]{2,5}|([0-9]{2,5}(\ [0-9]{2,5}){1,}))$ ]];
then
    echo "Hello"
else
    echo "false"
fi


for i in $ports; do
    if [[ $i =~ ^([0-9]{2,5})$ ]];
    then
        echo $i
    fi
done