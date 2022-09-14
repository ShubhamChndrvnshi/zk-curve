## Cairo code repo

- Tap into python venv 
```
source ~/cairo_venv/bin/activate
```

- Setting up network to testnet or add the --network=alpha-goerli flag to every command
```
export STARKNET_NETWORK=alpha-goerli
```

<b> To interact with StarkNet, we need to deploy an account contract </b>
* Steps:
    * Here we are using slightly modified version of OpenZeppelin’s standard for EOA contract. Set STARKNET_WALLET environment variable as follows:
    ```
    export STARKNET_WALLET=starkware.starknet.wallets.open_zeppelin.OpenZeppelinAccount
    ```
    * Run the following command to create an account:
    ```
    starknet deploy_account
    ```
    * using --account=my_account we can maintain multiple accounts
    * [Faucet](https://faucet.goerli.starknet.io/)
