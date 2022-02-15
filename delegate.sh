#!/bin/bash


WALLET="main"
CHAINID="umee-1"
RATE="uumee"
ADD_WALLET=umee13g6lzq6mfa8l86lgnsnxacltsssel6h0dg2r55
VAL_WALLET=umeevaloper13g6lzq6mfa8l86lgnsnxacltsssel6h0dvdv97


for(( i=1; i <=9999999; i++ ))
do
  echo xxx | umeed tx distribution withdraw-rewards $VAL_WALLET --commission --yes --gas auto --from $WALLET --chain-id umee-1 -y
  sleep 5

  BALANCE=$(umeed query bank balances $ADD_WALLET | grep "amount" | cut -d'"' -f 2)
#  BALANCE=$(echo $BALANCE | cut -d' ' -f 2)
  BALANCE=$((BALANCE - 50000))
  sleep 5
  printf "%b\n\n\n" "--------------------------------------------------------------------------------"
  echo xxx | umeed tx staking delegate $VAL_WALLET $BALANCE${RATE} --gas auto --from $WALLET --chain-id umee-1 -y
  sleep 60
done
