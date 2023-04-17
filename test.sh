

# regexp=^([0-9]{1,3}\.){3}[0-9]{1,3}$
ipAddress=$1
if [[ $ipAddress =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]];
then
  echo $ipAddress
fi