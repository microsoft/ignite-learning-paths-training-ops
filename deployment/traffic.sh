#!/bin/bash
# send traffic to OPS LP deployments
# v2.0 - Dean Bryen
touch logs.txt
read -p "What is the name of your Resource Group?: " RG
URL=http://$(az aks list -g ${RG} -o json | jq -r '.[0] | .addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName')
TOKEN=$(curl -X POST ${URL}/webbff/v1/login  --data " {username: 'foo@foo.com', password: 'foo@foo.com', grant_type: 'password'}" --header 'Content-Type: application/json' | jq -r '.access_token.token')
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
echo -e "${GREEN}-------------------------------------------------${NC}"
echo -e "TESTING USING TOKEN: ${YELLOW} ${TOKEN}"
echo -e "${GREEN}-------------------------------------------------${NC}"
echo -e "STARTING TEST TO URL: ${YELLOW} ${URL}"
echo -e "${GREEN}-------------------------------------------------${NC}"
echo -e "LOGS LOCATED AT: ${YELLOW}./${RG}-logs.txt"
echo -e "${GREEN}-------------------------------------------------${NC}"
echo -e "1. Sending Good Traffic to Frontend..." 
echo -e "1. Sending Good Traffic to Frontend..." >>${RG}-logs.txt 2>&1
echo -e "${GREEN}-------------------------------------------------${NC}"
# do it 4 times, but at 2 a time
seq 500 | parallel -n0 -j3 "curl -s -o /dev/null -w 'StatusCode: %{http_code}\n'  ${URL}/" >>${RG}-logs.txt 2>&1
echo -e "2. Sending Authorized Good Traffic to /shoppingcart..."
echo -e "2. Sending Authorized Good Traffic to /shoppingcart..." >>${RG}-logs.txt 2>&1
echo -e "${GREEN}-------------------------------------------------${NC}"
seq 200 | parallel -n0 -j3 "curl -H 'Authorization: Bearer ${TOKEN}' -s -o /dev/null -w 'StatusCode: %{http_code}\n'  ${URL}/cart-api/shoppingcart" >>${RG}-logs.txt 2>&1
echo -e "3. Sending Unauthorized Traffic to the /shoppingcart..."
echo -e "3. Sending Unauthorized Traffic to the /shoppingcart..." >>${RG}-logs.txt 2>&1 
echo -e "${GREEN}-------------------------------------------------${NC}"
seq 50 | parallel -n0 -j3 "curl -s -o /dev/null -w 'StatusCode: %{http_code}\n'  ${URL}/cart-api/shoppingcart" >>${RG}-logs.txt 2>&1
echo -e "4. Sending Authorized 404 Traffic to /hoppingcart..."
echo -e "4. Sending Authorized 404 Traffic to /hoppingcart..." >>${RG}-logs.txt 2>&1 
seq 200 | parallel -n0 -j3 "curl -H 'Authorization: Bearer ${TOKEN}' -s -o /dev/null -w 'StatusCode: %{http_code}\n'  ${URL}/cart-api/hoppingcart" >>${RG}-logs.txt 2>&1
echo -e "${GREEN}-------------------------------------------------${NC}"
echo -e "COMPLETED"
echo -e "COMPLETED" >>${RG}-logs.txt 2>&1
echo -e "LOGS LOCATED AT: ${YELLOW}./${RG}-logs.txt" 
echo -e "${GREEN}-------------------------------------------------${NC}"
