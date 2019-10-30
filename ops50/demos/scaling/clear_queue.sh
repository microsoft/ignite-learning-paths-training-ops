#!/bin/bash

#0 - load parameters
source ./params.sh


az storage message clear -q $QUEUE_NAME --account-name $STORAGE_ACC_NAME --account-key $STORAGE_ACC_KEY