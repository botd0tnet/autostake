#!/bin/bash


WALLET="BotDotNet"
CHAINID="umee-alpha-mainnet-3"
RATE="uumee"
ADD_WALLET=umeevaloper1sg2vam988aqenkrkdk3er0huuzyupejz8eaam9
VAL_WALLET=umeevaloper1unmdj75ku4yep237x246dymwx5f2lfw5lwexdt


for(( i=1; i <=9999999; i++ ))
do
  echo xxx | umeed tx distribution withdraw-rewards $VAL_WALLET --commission --yes --gas auto --from $WALLET --chain-id umee-alpha-mainnet-3 -y
  sleep 5

  BALANCE=$(umeed query bank balances $ADD_WALLET | grep "amount" | cut -d'"' -f 2)
  BALANCE=$(echo $BALANCE | cut -d' ' -f 2)
  BALANCE=$((BALANCE - 200000))
  sleep 5
  printf "%b\n\n\n" "--------------------------------------------------------------------------------"
  echo xxx | umeed tx staking delegate $VAL_WALLET $BALANCE${RATE} --gas auto --from $WALLET --chain-id umee-alpha-mainnet-3 -y
  sleep 30
done
