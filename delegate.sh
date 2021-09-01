#!/bin/bash


WALLET="BotDotNet"
CHAINID="umee-betanet-1"
RATE="uumee"
ADD_WALLET=$(umeed keys show $WALLET --address)

sleep 2

VAL_WALLET=$(umeed keys show $WALLET --bech val --address)

sleep 2

umeed tx distribution withdraw-rewards $VAL_WALLET --commission --yes --gas auto --fees 1000${RATE} --from $WALLET --chain-id $CHAINID -y

sleep 10

BALANCE=$(umeed query bank balances $ADD_WALLET | grep "amount" | cut -d'"' -f 2)
BALANCE=$(echo $BALANCE | cut -d' ' -f 2)
BALANCE=$((BALANCE - 100000))

sleep 2

printf "%b\n\n\n" "--------------------------------------------------------------------------------"
printf "%b\n\n\n"

umeed tx staking delegate $VAL_WALLET $BALANCE${RATE} --gas auto --fees 1000${RATE} --from $WALLET --chain-id $CHAINID -y

sleep 2


