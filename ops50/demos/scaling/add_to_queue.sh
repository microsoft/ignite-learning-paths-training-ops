#!/bin/bash

#0 - load parameters
source ./params.sh
echo "--------------------------------------------"
echo 'CURRENT NUMBER OF INSTANCES IN THE SCALE SET'
echo "--------------------------------------------"
az vmss list-instances --name $SCALE_SET_NAME -g $RESOURCE_GROUP -o table

sleep 5s
echo "-----------------------------"
echo 'SENDING MESSAGES TO THE QUEUE'
echo "-----------------------------"
for i in {1..50};
do
    echo "ADDING MESSAGE " $i
    az storage message put -q $QUEUE_NAME --content 'Hello Ignite The Tour' --account-name $STORAGE_ACC_NAME --account-key $STORAGE_ACC_KEY >/dev/null
done

sleep 5s
echo "------------------------------------------------------"
echo 'NUMBER OF INSTANCES IN SCALE SET AFTER SCALE CONDITION'
echo "------------------------------------------------------"
az vmss list-instances --name $SCALE_SET_NAME -g $RESOURCE_GROUP -o table