#!/bin/bash


WALLET="BotDotNet"
CHAINID="umeevengers-1"
RATE="uumee"
#ADD_WALLET=$(umeed keys show $WALLET --address)
ADD_WALLET=umee1unmdj75ku4yep237x246dymwx5f2lfw5l27fup

#sleep 2

#VAL_WALLET=$(umeed keys show $WALLET --bech val --address)
VAL_WALLET=umeevaloper1unmdj75ku4yep237x246dymwx5f2lfw5lwexdt

sleep 2



umeed tx distribution withdraw-rewards $VAL_WALLET --commission --yes --gas auto --fees 1000uumee --from $WALLET --chain-id umeevengers-1 -y

sleep 10

BALANCE=$(umeed query bank balances $ADD_WALLET | grep "amount" | cut -d'"' -f 2)
BALANCE=$(echo $BALANCE | cut -d' ' -f 2)
BALANCE=$((BALANCE - 400000000))
BALANCE=$((BALANCE - 200000))

sleep 2

printf "%b\n\n\n" "--------------------------------------------------------------------------------"

umeed tx staking delegate $VAL_WALLET $BALANCE${RATE} --gas auto --fees 1000uumee --from $WALLET --chain-id umeevengers-1 -y

sleep 1800
