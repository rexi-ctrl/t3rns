#!/bin/bash
echo "Welcome to the t3rn ALE!"

sleep 1
cd $HOME
rm -rf executor
sudo apt -q update
sudo apt -qy upgrade

EXECUTOR_URL="https://github.com/t3rn/executor-release/releases/download/v0.21.1/executor-linux-v0.21.1.tar.gz"
EXECUTOR_FILE="executor-linux-v0.21.1.tar.gz"
echo "Downloading the Executor binary from $EXECUTOR_URL..."
curl -L -o $EXECUTOR_FILE $EXECUTOR_URL
if [ $? -ne 0 ]; then
    echo "Failed to download the Executor binary. Please check your internet connection and try again."
    exit 1
fi
echo "Extracting the binary..."
tar -xzvf $EXECUTOR_FILE
rm -rf $EXECUTOR_FILE
cd executor/executor/bin
echo "Binary downloaded and extracted successfully."
echo

export NODE_ENV=testnet
export LOG_LEVEL=debug
export LOG_PRETTY=false
export PRIVATE_KEY_LOCAL=
export ENABLED_NETWORKS='arbitrum-sepolia,base-sepolia,optimism-sepolia,l1rn'

export RPC_ENDPOINTS_ARBT='https://arb-sepolia.g.alchemy.com/v2/tXvPJEPKcBilxlf8-v_h1GW6U1I3mtZC'
export RPC_ENDPOINTS_BSSP='https://base-sepolia.g.alchemy.com/v2/tXvPJEPKcBilxlf8-v_h1GW6U1I3mtZC'
export RPC_ENDPOINTS_BLSS='https://blast-sepolia.g.alchemy.com/v2/tXvPJEPKcBilxlf8-v_h1GW6U1I3mtZC'
export RPC_ENDPOINTS_OPSP='https://opt-sepolia.g.alchemy.com/v2/tXvPJEPKcBilxlf8-v_h1GW6U1I3mtZC'

sleep 1

echo "Starting the Executor..."
./executor
