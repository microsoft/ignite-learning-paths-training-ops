#!/bin/bash
set -e


#Configure storage queue
az storage queue create --name $QUEUE_NAME  --account-name $STORAGE_ACCOUNT_NAME  --account-key $STORAGE_ACCOUNT_KEY

