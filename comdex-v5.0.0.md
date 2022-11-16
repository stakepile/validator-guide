# Comdex v5.0.0 Upgrade - Adding Authz + ICA modules

Upgrade is scheduled for block `5133000`. Countdown clock [here](https://www.mintscan.io/comdex/blocks/5133000)

This guide assumes cosmovisor is used to manage upgrades

```bash
# Get new version
cd comdex
git pull
git checkout v5.0.0
make install
```

# Check version

```bash
# Should show v5.0.0
comdex version
# Should be commit d8a016d3738a635ef8e1601e9be60dff3a3005b6
comdex version --long | grep commit
```

# Copy binary to cosmovisor upgrade folder

```bash
mkdir -p $HOME/.comdex/cosmovisor/upgrades/v5.0.0/bin
cp $HOME/go/bin/comdex $HOME/.comdex/cosmovisor/upgrades/v5.0.0/bin
```

# Confirm new version

```bash
# Should show v4.0.0
$HOME/.comdex/cosmovisor/upgrades/v5.0.0/bin/comdex version
```