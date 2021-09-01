#!/bin/bash


WALLET="BotDotNet"
CHAINID="umee-betanet-1"
RATE="uumee"
ADD_WALLET=$(umeed keys show $WALLET --address)
VAL_WALLET=$(umeed keys show $WALLET --bech val --address)
BALANCE=$(umeed query bank balances $(umeed keys show $WALLET --address) | grep "amount" | cut -d'"' -f 2)
BALANCE=$((BALANCE - 1000000))

umeed tx distribution withdraw-rewards $VAL_WALLET --commission --yes --gas auto --fees 1000${RATE} --from $WALLET --chain-id $CHAINID -y

sleep 2


umeed tx staking redelegate $VAL_WALLET $VAL_WALLET $BALANCE${RATE} --gas auto --fees 1000${RATE} --from $WALLET --chain-id $CHAINID -y

sleep 2






